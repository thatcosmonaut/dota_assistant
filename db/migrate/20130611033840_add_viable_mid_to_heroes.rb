class AddViableMidToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :viable_solo, :integer
  end
end
