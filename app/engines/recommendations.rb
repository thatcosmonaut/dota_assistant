module Recommendations
  IDEAL_BALANCED_VECTOR = Vector.elements([3, 3, 3, 5, 3, 1, 2, 4, 0, 2, 3, 2, 3]) #does not include offlane
  IDEAL_JUNGLING_VECTOR = Vector.elements([3, 3, 3, 3, 4, 3, 1, 1, 3, 3, 3, 2, 2, 2])
  IDEAL_TRILANE_VECTOR = Vector.elements([3, 3, 3, 3, 5, 3, 1, 3, 3, 0, 3, 3, 1, 2])

  class << self
    #lower score is better
    def pick_recommendations friendly_heroes, enemy_heroes, ideal_composition_vector
      remaining_heroes = remaining_heroes(friendly_heroes, enemy_heroes)

      scores = [].tap do |score_builder|
        remaining_heroes.each do |hero|
          score_builder << [hero, calculate_score(friendly_heroes + [hero], ideal_composition_vector)]
        end
      end.sort_by { |a, b| b }

      [scores.first(5), scores.last(5)]
    end

    def remaining_heroes friendly_heroes, enemy_heroes
      Hero.where.not(id: (friendly_heroes.map(&:id) + enemy_heroes.map(&:id)))
    end

    #want to eliminate branching here somehow
    def calculate_score friendly_heroes, ideal_composition_vector
      team_vector = friendly_heroes.map(&"role_vector_for_#{ideal_composition_vector.underscore}".to_sym).inject(:+)
      (const_get(ideal_composition_vector) - team_vector).map {|x| x * x }.inject(:+)
    end
  end
end
