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
  has_many :counters_as_weak, foreign_key: :weak_id, class_name: Counter
  has_many :counters_as_strong, foreign_key: :strong_id, class_name: Counter

  #counter associations
  has_many :weak_against, through: :counters_as_weak, source: :strong
  has_many :strong_against, through: :counters_as_strong, source: :weak

  validates :name, :viable_solo, :attack_type, :main_attribute, presence: true

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

  def weak_against?(hero)
    weak_against.include?(hero)
  end

  def strong_against?(hero)
    strong_against.include?(hero)
  end

  def add_weak_against hero
    return unless !weak_against?(hero)
    counter = Counter.new
    counter.weak_id = id
    counter.strong_id = hero.id
    counter.save
  end

  def add_strong_against hero
    return unless !strong_against?(hero)
    counter = Counter.new
    counter.weak_id = hero.id
    counter.strong_id = id
    counter.save
  end

end
