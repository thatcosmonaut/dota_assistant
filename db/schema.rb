# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130611204618) do

  create_table "counters", :force => true do |t|
    t.integer "weak_id"
    t.integer "strong_id"
  end

  create_table "heroes", :force => true do |t|
    t.integer "strength"
    t.integer "agility"
    t.integer "intelligence"
    t.float   "armor"
    t.integer "movement_speed"
    t.float   "strength_increase"
    t.float   "agility_increase"
    t.float   "intelligence_increase"
    t.string  "main_attribute"
    t.string  "name"
    t.string  "attack_type"
    t.integer "viable_solo"
  end

  create_table "heroes_roles", :force => true do |t|
    t.integer "hero_id"
    t.integer "role_id"
    t.integer "value"
  end

  add_index "heroes_roles", ["hero_id", "role_id"], :name => "index_heroes_roles_on_hero_id_and_role_id"

  create_table "roles", :force => true do |t|
    t.string "name"
  end

end
