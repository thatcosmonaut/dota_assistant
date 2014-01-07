module Recommendations
  IDEAL_BALANCED_VECTOR = Vector.elements([3, 3, 3, 5, 3, 1, 2, 4, 0, 2, 3, 2, 3]) #does not include offlane
  IDEAL_JUNGLING_VECTOR = Vector.elements([3, 3, 3, 3, 4, 3, 1, 1, 3, 3, 3, 2, 2, 2])
  IDEAL_TRILANE_VECTOR = Vector.elements([3, 3, 3, 3, 5, 3, 1, 3, 3, 0, 3, 3, 1, 2])

  ROLE_INDEX_WITH_OFFLANE = [
    :mid,
    :offlane,
    :carry,
    :disabler,
    :durable,
    :escape,
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
    :escape,
    :ganker,
    :initiator,
    :jungler,
    :lane_support,
    :nuker,
    :pusher,
    :support
  ]

  class << self
    #lower score is better
    def pick_recommendations friendly_heroes, enemy_heroes, banned_heroes, ideal_composition_vector
      remaining_heroes = remaining_heroes(friendly_heroes, enemy_heroes, banned_heroes)

      scores = [].tap do |score_builder|
        remaining_heroes.each do |hero|
          score_builder << [hero, calculate_score(friendly_heroes + [hero], ideal_composition_vector)]
        end
      end.sort_by { |a, b| b }

      [scores.first(5).map(&:first), scores.last(5).map(&:first)]
    end

    def role_recommendations friendly_heroes, ideal_composition_vector
      differences = (const_get(ideal_composition_vector) - team_vector(friendly_heroes, ideal_composition_vector)).to_a
      differences.shift
      if ideal_composition_vector == 'IDEAL_BALANCED_VECTOR'
        ROLE_INDEX[differences.index(differences.max)]
      else
        ROLE_INDEX_WITH_OFFLANE[differences.index(differences.max)]
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
