module Recommendations
  IDEAL_BALANCED_VECTOR = Vector.elements([3, 3, 3, 5, 3, 2, 4, 0, 2, 3, 2, 3]) #does not include offlane
  IDEAL_JUNGLING_VECTOR = Vector.elements([3, 3, 3, 3, 4, 3, 1, 3, 3, 3, 2, 2, 2])
  IDEAL_TRILANE_VECTOR = Vector.elements([3, 3, 3, 3, 5, 3, 3, 3, 0, 3, 3, 1, 2])

  ROLE_INDEX_WITH_OFFLANE = [
    :mid,
    :offlane,
    :carry,
    :disabler,
    :durable,
    :ganker,
    :initiator,
    :jungler,
    :lane_support,
    :nuker,
    :pusher,
    :support
  ]

  ROLE_INDEX = [
    :mid,
    :carry,
    :disabler,
    :durable,
    :ganker,
    :initiator,
    :jungler,
    :lane_support,
    :nuker,
    :pusher,
    :support
  ]

  VECTOR_TO_ROLE = {
    "IDEAL_BALANCED_VECTOR" => "ROLE_INDEX",
    "IDEAL_JUNGLING_VECTOR" => "ROLE_INDEX_WITH_OFFLANE",
    "IDEAL_TRILANE_VECTOR" => "ROLE_INDEX_WITH_OFFLANE"
  }

  class << self
    #lower score is better
    def pick_recommendations friendly_heroes, enemy_heroes, banned_heroes, ideal_composition_vector
      remaining_heroes = remaining_heroes(friendly_heroes, enemy_heroes, banned_heroes)
      scores = hero_scores friendly_heroes, remaining_heroes, ideal_composition_vector
      [scores.first(5).map(&:first), scores.last(5).map(&:first)]
    end

    def hero_scores friendly_heroes, remaining_heroes, ideal_composition_vector
      [].tap do |score_builder|
        remaining_heroes.each do |hero|
          score_builder << [hero, calculate_score(friendly_heroes + [hero], ideal_composition_vector)]
        end
      end.sort_by { |a, b| b }
    end

    def role_recommendations friendly_heroes, ideal_composition_vector
      differences = (const_get(ideal_composition_vector) - team_vector(friendly_heroes, ideal_composition_vector)).to_a
      differences.shift # don't need to consider attack value
      [].tap do |roles_needed|
        2.times do
          max_index = differences.index(differences.max)
          roles_needed << const_get(VECTOR_TO_ROLE[ideal_composition_vector])[ max_index ]
          differences[max_index] = 0
        end
      end
    end

    def remaining_heroes friendly_heroes, enemy_heroes, banned_heroes
      Hero.where.not(id: (friendly_heroes + enemy_heroes + banned_heroes).map(&:id))
    end

    def team_vector friendly_heroes, ideal_composition_vector
      friendly_heroes.map(&"role_vector_for_#{ideal_composition_vector.underscore}".to_sym).inject(:+)
    end

    def calculate_score friendly_heroes, ideal_composition_vector
      (const_get(ideal_composition_vector) - team_vector(friendly_heroes, ideal_composition_vector)).map {|x| x * x }.inject(:+)
    end
  end
end
