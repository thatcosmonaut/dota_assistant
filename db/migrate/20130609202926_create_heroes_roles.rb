class CreateHeroesRoles < ActiveRecord::Migration
  def change
    create_table :heroes_roles do |t|
      t.integer :hero_id
      t.integer :role_id
      t.integer :value
    end
  end
end
