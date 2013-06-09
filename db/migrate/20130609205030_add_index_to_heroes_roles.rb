class AddIndexToHeroesRoles < ActiveRecord::Migration
  def change
    add_index :heroes_roles, [:hero_id, :role_id]
  end
end
