class AddAttackTypeToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :attack_type, :string
  end
end
