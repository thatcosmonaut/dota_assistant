class Recommendations

  def self.best_pick list_of_heroes
    original_list = list_of_heroes 
    remaining_heroes = Hero.all.select{ |hero| !original_list.include?(hero) }
    scores = []
    remaining_heroes.each do |hero|
      scores << [hero.name, score(list_of_heroes + [hero])]
    end
    scores
  end

  #given list of heroes
  #returns best pick
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
    
    support_bonus = false
    carry_bonus = false

    support_bonus = true if (role_values[:support] + role_values[:lane_support]) > 4
    carry_bonus = true if role_values[:carry] < 4

    score = roles_filled + ((support_bonus ? 1 : 0) * 10) + ((carry_bonus ? 1 : 0) * 10)
  end
end
