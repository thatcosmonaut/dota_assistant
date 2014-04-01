class RemoveCounters < ActiveRecord::Migration
  def change
    drop_table :counters
  end
end
