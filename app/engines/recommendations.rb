module Recommendations
  IDEAL_BALANCED_VECTOR = Vector.elements([3, 3, 3, 5, 3, 2, 4, 2, 3, 2, 3]) #does not include offlane or jungling
  IDEAL_JUNGLING_VECTOR = Vector.elements([3, 3, 3, 3, 4, 3, 1, 3, 3, 3, 2, 2, 2])
  IDEAL_TRILANE_VECTOR = Vector.elements([3, 3, 3, 3, 5, 3, 3, 3, 3, 3, 1, 2]) #does not include jungling

  ROLE_INDEX_FOR_JUNGLING = [
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

  ROLE_INDEX_FOR_TRILANE = [
    :mid,
    :offlane,
    :carry,
    :disabler,
    :durable,
    :ganker,
    :initiator,
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
    :lane_support,
    :nuker,
    :pusher,
    :support
  ]

  VECTOR_TO_ROLE = {
    "IDEAL_BALANCED_VECTOR" => "ROLE_INDEX",
    "IDEAL_JUNGLING_VECTOR" => "ROLE_INDEX_FOR_JUNGLING",
    "IDEAL_TRILANE_VECTOR" => "ROLE_INDEX_FOR_TRILANE"
  }

  INFINITY_TYPE = {
    "min" => Float::INFINITY,
    "max" => -Float::INFINITY
  }

  class << self
    #lower score is better
    def pick_recommendations friendly_heroes, enemy_heroes, banned_heroes, ideal_composition_vector
      remaining_heroes = remaining_heroes(friendly_heroes, enemy_heroes, banned_heroes)
      scores = (hero_scores friendly_heroes, remaining_heroes, ideal_composition_vector).map(&:first)
      [scores.first(5), scores.last(5)]
    end

    def hero_scores friendly_heroes, remaining_heroes, ideal_composition_vector
      [].tap do |score_builder|
        remaining_heroes.each do |hero|
          score_builder << [hero, calculate_score(friendly_heroes + [hero], ideal_composition_vector)]
        end
      end.sort_by { |a, b| b }
    end

    def roles_filled friendly_heroes, ideal_composition_vector
      role_analysis("min", friendly_heroes, ideal_composition_vector)
    end

    def roles_needed friendly_heroes, ideal_composition_vector
      role_analysis("max", friendly_heroes, ideal_composition_vector)
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

    private

    def role_analysis(min_or_max, friendly_heroes, ideal_composition_vector)
      differences = (const_get(ideal_composition_vector) - team_vector(friendly_heroes, ideal_composition_vector)).to_a
      differences.shift #don't need to consider attack value
      [].tap do |roles|
        2.times do
          index = differences.index(differences.send(min_or_max))
          roles << const_get(VECTOR_TO_ROLE[ideal_composition_vector])[index]
          differences[index] = INFINITY_TYPE[min_or_max]
        end
      end
    end
  end
end
