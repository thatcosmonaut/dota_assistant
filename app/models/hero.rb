class Hero < ActiveRecord::Base

  has_many :builds

  validates :name, :viable_mid, :viable_offlane, :attack_type, :main_attribute, presence: true

  default_scope -> { order('heroes.id ASC') }

  scope :with_role, -> (name = nil) { joins(:roles).where(roles: {name: name}).uniq }
  scope :with_main_attribute, -> (attribute = nil) { where(main_attribute: attribute) }
  scope :with_attack_type, -> (attack_type = nil) { where(attack_type: attack_type) }

  scope :radiant, -> { where(team: :radiant) }
  scope :dire, -> { where(team: :dire) }

end
