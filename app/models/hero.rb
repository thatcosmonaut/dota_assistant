class Hero < ActiveRecord::Base
  VALID_ROLES = [
    :lane_support,
    :carry,
    :disabler,
    :ganker,
    :nuker,
    :initiator,
    :jungler,
    :pusher,
    :roamer,
    :durable,
    :escape,
    :semi_carry,
    :support
  ]

  has_many :heroes_roles
  has_many :roles, through: :heroes_roles
  has_many :key_items
  has_many :abilities

  validates :name, :viable_solo, :attack_type, :strength, :agility, :intelligence, :strength_increase, :agility_increase, :intelligence_increase, :armor, :movement_speed, :main_attribute, presence: true

  def add_role role_name, value
    if VALID_ROLES.include? role_name
      role_name = role_name.to_s
      role = Role.find_by_name(role_name)
      heroes_roles << HeroesRole.create(role_id: role.id, hero_id: id, value: value)
    end
  end

  def value_of_role role_name
    if join = join_for_role(role_name)
      return join.value
    else
      return 0
    end
  end

  def join_for_role role_name
    role_name = role_name.to_s
    heroes_roles.detect { |hr| hr.role.name == role_name } 
  end
end
