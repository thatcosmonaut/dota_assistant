class Recommendations
  #given list of heroes
  #returns best pick
  def self.best_pick list_of_heroes
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

    role_values
  end
end
