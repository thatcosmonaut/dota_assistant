class HeroesRole < ActiveRecord::Base
  belongs_to :hero
  belongs_to :role
end
