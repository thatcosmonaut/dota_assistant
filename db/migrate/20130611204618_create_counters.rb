class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.integer :weak_id
      t.integer :strong_id
    end
  end
end
