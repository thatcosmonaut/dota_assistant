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

  validates :name, :strength, :agility, :intelligence, :strength_increase, :agility_increase, :intelligence_increase, :armor, :movement_speed, :main_attribute, presence: true

  def add_role role_name, value
    if VALID_ROLES.include? role_name
      role = Role.find_by_name(role_name)
      heroes_roles << HeroesRole.create(role_id: role.id, hero_id: id, value: value)
    end
  end
end
