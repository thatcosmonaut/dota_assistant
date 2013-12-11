class Recommendations
  TARGET_VECTOR = Vector.elements([3, 4, 3, 3, 1, 2, 3, 2, 2, 3, 2, 3])

  class << self
    #given list of heroes
    #returns top five picks for team and worst five picks
    #lower score is better
    def pick_recommendations friendly_heroes, enemy_heroes
      remaining_heroes = remaining_heroes(friendly_heroes, enemy_heroes)

      scores = []
      remaining_heroes.each do |hero|
        scores << [hero, calculate_score(friendly_heroes + [hero])]
      end

      scores = scores.sort_by { |a, b| b }
      best_picks = scores[0..4]
      worst_picks = scores[remaining_heroes.size-5..remaining_heroes.size-1]

      [best_picks, worst_picks]
    end

    def remaining_heroes friendly_heroes, enemy_heroes
      Hero.where.not(name: (friendly_heroes + enemy_heroes).map(&:name))
    end

    def heroes_to_check remaining_heroes, role_values
      heroes = []
      heroes += Hero.carries.sample(3) if role_values[:carry] < 3
      heroes += Hero.supports.sample(3) if role_values[:support] + role_values[:lane_support] < 5
      heroes += Hero.pushers.sample(3) if role_values[:pusher] < 1
      heroes += Hero.initiators.sample(3) if role_values[:initiator] < 1
      heroes += Hero.disablers.sample(3) if role_values[:disabler] < 1
      heroes += Hero.gankers.sample(3) if role_values[:ganker] < 1
      heroes += Hero.junglers.sample(3) if role_values[:jungler] < 1
      heroes += Hero.durables.sample(3) if role_values[:durable] < 1
      heroes && remaining_heroes
    end

    def calculate_score friendly_heroes
      team_vector = friendly_heroes.map(&:role_vector).inject(:+)
      (TARGET_VECTOR - team_vector).map {|x| x * x }.inject(:+)
    end

    # def calculate_score friendly_heroes, enemy_heroes, role_values
    #   [roles_filled_score(role_values),
    #     support_bonus(role_values[:support],role_values[:lane_support]),
    #     carry_bonus(role_values[:carry]),
    #     melee_and_ranged_bonus(friendly_heroes),
    #     disabler_bonus(role_values[:disabler]),
    #     initiator_bonus(role_values[:initiator]),
    #     durable_bonus(role_values[:durable]),
    #     mid_bonus(friendly_heroes),
    #     counter_value(friendly_heroes, enemy_heroes)].inject(:+)
    # end

    def roles_filled_score role_values
      role_values.select { |role_name, value| value > 0 }.count * 2
    end

    def melee_and_ranged_bonus friendly_heroes
      friendly_heroes.map(&:attack_type).count{ |type| type == :ranged } > 1 ? 5 : 0
    end

    def support_bonus support_value, lane_support_value
      (support_value + lane_support_value) > 4 ? 10 : 0
    end

    def carry_bonus carry_value
      carry_bonus = 0
      carry_bonus = 30 if carry_value > 0
      carry_bonus -= (carry_value * 5) if carry_value > 5
      carry_bonus
    end

    #should maybe compare disabler values of two teams: having more stun is important
    def disabler_bonus disabler_value
      disabler_value > 0 ? 5 : 0
    end

    def initiator_bonus initiator_value
      initiator_value > 0 ? 5 : 0
    end

    def durable_bonus durable_value
      durable_value > 0 ? 5 : 0
    end

    def mid_bonus friendly_heroes
      solo_hero_count = friendly_heroes.count{ |hero| hero.viable_solo > 0 }
      (0 < solo_hero_count && solo_hero_count < 5) ? 5 : 0
    end

    def counter_value friendly_heroes, enemy_heroes
      counter_bonus = 0
      friendly_heroes.each do |hero|
        enemy_heroes.each do |enemy|
          counter_bonus += 5 if hero.strong_against?(enemy)
          counter_bonus -= 5 if hero.weak_against?(enemy)
        end
      end
      counter_bonus
    end

  end
end
