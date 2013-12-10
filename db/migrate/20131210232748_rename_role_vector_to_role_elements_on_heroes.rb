class RenameRoleVectorToRoleElementsOnHeroes < ActiveRecord::Migration
  def change
    rename_column :heroes, :role_vector, :role_elements
  end
end
