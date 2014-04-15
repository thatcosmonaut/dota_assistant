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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140415071847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "builds", force: true do |t|
    t.string  "name"
    t.integer "carry"
    t.integer "disabler"
    t.integer "durable"
    t.integer "ganker"
    t.integer "initiator"
    t.integer "jungler"
    t.integer "lane_support"
    t.integer "nuker"
    t.integer "pusher"
    t.integer "support"
    t.integer "hero_id"
    t.text    "role_elements"
  end

  create_table "heroes", force: true do |t|
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
    t.integer "viable_mid"
    t.text    "role_elements"
    t.string  "team"
    t.integer "viable_offlane"
  end

end
