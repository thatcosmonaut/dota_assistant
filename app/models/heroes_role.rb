class HeroesRole < ActiveRecord::Base
  attr_accessible :hero_id, :role_id, :value
  
  belongs_to :hero
  belongs_to :role
end
