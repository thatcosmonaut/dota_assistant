class ChangeViableSolo < ActiveRecord::Migration
  def change
    rename_column :heroes, :viable_solo, :viable_mid
    add_column :heroes, :viable_offlane, :integer
  end
end
