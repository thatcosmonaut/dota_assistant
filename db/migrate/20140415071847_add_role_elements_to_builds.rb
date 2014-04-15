class AddRoleElementsToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :role_elements, :text
  end
end
