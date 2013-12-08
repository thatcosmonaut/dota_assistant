#need some kind of teamfight metric
class Recommendations
  #given list of heroes
  #returns top three picks for team and worst three picks

  class << self
    def best_pick friendly_heroes, enemy_heroes
      remaining_heroes = Hero.all.select{ |hero| !friendly_heroes.include?(hero) && !enemy_heroes.include?(hero) }
      scores = []
      remaining_heroes.each do |hero|
        scores << [hero, score(friendly_heroes + [hero], enemy_heroes)]
      end

      scores = scores.sort_by { |a, b| b }.reverse
      [scores[0,5], scores[remaining_heroes.size-5, remaining_heroes.size]]
    end

    #given list of heroes
    #returns score value of team
    def score friendly_heroes, enemy_heroes
      role_values = calculate_role_values(friendly_heroes)
      calculate_score(friendly_heroes, enemy_heroes, role_values)
    end

    def calculate_role_values friendly_heroes
      role_values = {
        :lane_support => 0,
        :carry => 0,
        :disabler => 0,
        :ganker => 0,
        :nuker => 0,
        :initiator => 0,
        :jungler => 0,
        :pusher => 0,
        :roamer => 0,
        :durable => 0,
        :escape => 0,
        :semi_carry => 0,
        :support => 0
      }

      friendly_heroes.each do |hero|
        hero.roles.each do |role|
          role_values[role.name.to_sym] += hero.value_of_role(role.name)
        end
      end

      role_values
    end

    def calculate_score friendly_heroes, enemy_heroes, role_values
      roles_filled_score(role_values) + support_bonus(role_values[:support], role_values[:lane_support]) \
        + carry_bonus(role_values[:carry]) + melee_and_ranged_bonus(friendly_heroes) \
        + disabler_bonus(role_values[:disabler]) + initiator_bonus(role_values[:initiator]) \
        + durable_bonus(role_values[:durable]) + mid_bonus(friendly_heroes) + counter_value(friendly_heroes, enemy_heroes)
    end

    def roles_filled_score role_values
      role_values.select { |role_name, value| value > 0 }.count * 2
    end

    def melee_and_ranged_bonus friendly_heroes
      ranged_count = friendly_heroes.map(&:attack_type).count{ |type| type == :ranged }
      ranged_count > 1 ? 5 : 0
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
          counter_bonus += 3 if hero.strong_against?(enemy)
          counter_bonus -= 3 if hero.weak_against?(enemy)
        end
      end
      counter_bonus
    end

  end
end
