class Recommendations

  #given list of heroes
  #returns top three picks for team
  def self.best_pick list_of_heroes
    original_list = list_of_heroes 
    remaining_heroes = Hero.all.select{ |hero| !original_list.include?(hero) }
    scores = []
    remaining_heroes.each do |hero|
      scores << [hero.name, score(list_of_heroes + [hero])]
    end

    scores = scores.sort_by { |a, b| b }.reverse
    scores[0,3]
  end

  #given list of heroes
  #returns score value of team
  def self.score list_of_heroes
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

    list_of_heroes.each do |hero|
      hero.roles.each do |role|
        role_values[role.name.to_sym] += hero.value_of_role(role.name)
      end
    end

    roles_filled = role_values.select { |role_name, value| value > 0 }.count
    
    support_bonus = (role_values[:support] + role_values[:lane_support]) > 4

    carry_bonus = 20
    carry_bonus = carry_bonus - (role_values[:carry] * 4) if role_values[:carry] > 5

    not_all_melee_bonus = not_all_melee(list_of_heroes)

    disabler_bonus = role_values[:disabler] > 0
    initiator_bonus = role_values[:initiator] > 0

    tank_bonus = role_values[:durable] > 0

    solo_value = 0
    list_of_heroes.each do |hero|
      solo_value += hero.viable_solo
    end

    mid_bonus = solo_value > 1

    score = (roles_filled * 2) + ((support_bonus ? 1 : 0) * 10) \
      + carry_bonus + ((not_all_melee_bonus ? 1 : 0) * 5) \
      + ((disabler_bonus ? 1 : 0) * 5) + ((initiator_bonus ? 1 : 0) * 5) \
      + ((tank_bonus ? 1 : 0) * 5) + ((mid_bonus ? 1 : 0) * 10 ) 
  end

  def self.not_all_melee list_of_heroes
    not_all_melee = false
    list_of_heroes.each do |hero|
      not_all_melee = true if hero.attack_type == "ranged"
    end
    not_all_melee
  end
end
