class Hero < ActiveRecord::Base
  VALID_ROLES = [
    :carry,
    :disabler,
    :durable,
    :escape,
    :ganker,
    :initiator,
    :jungler,
    :lane_support,
    :nuker,
    :pusher,
    :roamer,
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

  scope :carries, -> { joins(:roles).where("roles.name = ?", 'carry').uniq }
  scope :disablers, -> { joins(:roles).where("roles.name = ?", 'disabler').uniq }
  scope :supports, -> { joins(:roles).where("roles.name = ? OR roles.name = ?", 'support', 'lane_support').uniq }
  scope :initiators, -> { joins(:roles).where("roles.name = ?", 'initiator').uniq }
  scope :pushers, -> { joins(:roles).where("roles.name = ?", 'pusher').uniq }
  scope :gankers, -> { joins(:roles).where("roles.name = ?", 'ganker').uniq }
  scope :junglers, -> { joins(:roles).where("roles.name = ?", 'jungler').uniq }
  scope :durables, -> { joins(:roles).where("roles.name = ?", 'durable').uniq }

  #used in role vector
  serialize :role_elements

  def add_role role_name, value
    if VALID_ROLES.include? role_name
      role_name = role_name.to_s
      role = Role.find_by_name(role_name)
      heroes_roles << HeroesRole.create(role_id: role.id, hero_id: id, value: value)
    end
  end

  def role_vector
    Vector.elements(role_elements)
  end

  def save_role_elements
    attack_value = attack_type == "ranged" ? 1 : 0
    self.role_elements = [attack_value] + VALID_ROLES.map{|role_name| value_of_role(role_name)}
    save
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
