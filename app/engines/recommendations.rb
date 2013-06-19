class Recommendations
  
  #given list of heroes
  #returns top three picks for team and worst three picks
  def self.best_pick friendly_heroes, enemy_heroes
    remaining_heroes = Hero.all.select{ |hero| !friendly_heroes.include?(hero) && !enemy_heroes.include?(hero) }
    scores = []
    remaining_heroes.each do |hero|
      scores << [hero, score(friendly_heroes + [hero], enemy_heroes)]
    end

    scores = scores.sort_by { |a, b| b }.reverse
    [scores[0,3], scores[remaining_heroes.size-3, remaining_heroes.size]]
  end

  # TO DO: break up into individual methods

  #given list of heroes
  #returns score value of team
  def self.score friendly_heroes, enemy_heroes
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

    #this score should track highest value of each role that is filled and add them together
    #i.e. if you have a hero that is ganker lvl 1 and disabler lvl 3 and a hero that is ganker lvl 3 and disabler lvl 1, you will get 3 + 3
    roles_filled = role_values.select { |role_name, value| value > 0 }.count
    
    support_bonus = (role_values[:support] + role_values[:lane_support]) > 4

    carry_bonus = 0
    carry_bonus = 30 if role_values[:carry] > 0
    carry_bonus = carry_bonus - (role_values[:carry] * 5) if role_values[:carry] > 5

    not_all_melee_bonus = not_all_melee(friendly_heroes)

    disabler_bonus = role_values[:disabler] > 0
    initiator_bonus = role_values[:initiator] > 0

    tank_bonus = role_values[:durable] > 0

    solo_value = 0
    friendly_heroes.each do |hero|
      solo_value += hero.viable_solo
    end

    mid_bonus = solo_value > 1

    counter_bonus = 0
    friendly_heroes.each do |hero|
      enemy_heroes.each do |enemy|
        counter_bonus += 3 if hero.strong_against.include?(enemy)
      end
    end

    enemy_counter_penalty = 0
    friendly_heroes.each do |hero|
      enemy_heroes.each do |enemy|
        enemy_counter_penalty -= 3 if hero.weak_against.include?(enemy)
      end
    end

    score = (roles_filled * 2) + ((support_bonus ? 1 : 0) * 10) \
      + carry_bonus + ((not_all_melee_bonus ? 1 : 0) * 5) \
      + ((disabler_bonus ? 1 : 0) * 5) + ((initiator_bonus ? 1 : 0) * 5) \
      + ((tank_bonus ? 1 : 0) * 5) + ((mid_bonus ? 1 : 0) * 10 ) + counter_bonus + enemy_counter_penalty
  end

  def self.not_all_melee list_of_heroes
    not_all_melee = false
    list_of_heroes.each do |hero|
      not_all_melee = true if hero.attack_type == "ranged"
    end
    not_all_melee
  end
end
