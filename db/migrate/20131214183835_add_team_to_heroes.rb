class AddTeamToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :team, :string
  end
end
