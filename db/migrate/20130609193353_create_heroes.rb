class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.integer :strength
      t.integer :agility
      t.integer :intelligence
      t.float :armor
      t.integer :movement_speed

      t.float :strength_increase
      t.float :agility_increase
      t.float :intelligence_increase
      t.string :main_attribute
    end
  end
end
