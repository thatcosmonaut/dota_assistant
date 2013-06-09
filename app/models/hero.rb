class Hero < ActiveRecord::Base
  has_many :roles
  has_many :key_items
  has_many :abilities

  validates :name, :strength, :agility, :intelligence, :strength_increase, :agility_increase, :intelligence_increase, :armor, :movement_speed, :main_attribute, presence: true
end
