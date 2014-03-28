class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :name
      t.integer :carry
      t.integer :disabler
      t.integer :durable
      t.integer :ganker
      t.integer :initiator
      t.integer :jungler
      t.integer :lane_support
      t.integer :nuker
      t.integer :pusher
      t.integer :support
      t.integer :hero_id
    end
  end
end
