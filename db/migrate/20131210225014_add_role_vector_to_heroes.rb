class AddRoleVectorToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :role_vector, :text
  end
end
