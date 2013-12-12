class Recommendations
  TARGET_VECTOR = Vector.elements([3, 1, 3, 5, 3, 1, 2, 4, 1, 2, 3, 2, 3])

  class << self
    #lower score is better
    def pick_recommendations friendly_heroes, enemy_heroes
      remaining_heroes = remaining_heroes(friendly_heroes, enemy_heroes)

      scores = [].tap do |score_builder|
        remaining_heroes.each do |hero|
          score_builder << [hero, calculate_score(friendly_heroes + [hero])]
        end
      end

      scores = scores.sort_by { |a, b| b }

      [scores.first(5), scores.last(5)]
    end

    def remaining_heroes friendly_heroes, enemy_heroes
      Hero.where.not(name: (friendly_heroes + enemy_heroes).map(&:name))
    end

    def calculate_score friendly_heroes
      team_vector = friendly_heroes.map(&:role_vector).inject(:+)
      (TARGET_VECTOR - team_vector).map {|x| x * x }.inject(:+)
    end

    def mid_bonus friendly_heroes
      solo_hero_count = friendly_heroes.count{ |hero| hero.viable_solo > 0 }
      (0 < solo_hero_count && solo_hero_count < 5) ? 5 : 0
    end

    def counter_value friendly_heroes, enemy_heroes
      counter_bonus = 0
      friendly_heroes.each do |hero|
        enemy_heroes.each do |enemy|
          counter_bonus -= 2 if hero.strong_against?(enemy)
          counter_bonus += 2 if hero.weak_against?(enemy)
        end
      end
      counter_bonus
    end

  end
end
