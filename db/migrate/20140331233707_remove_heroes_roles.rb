class RemoveHeroesRoles < ActiveRecord::Migration
  def change
    drop_table :heroes_roles
    drop_table :roles
  end
end
