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

ActiveRecord::Schema.define(version: 20140504041858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: true do |t|
    t.integer  "passenger_id"
    t.integer  "teleporter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookings", ["passenger_id"], name: "index_bookings_on_passenger_id", using: :btree
  add_index "bookings", ["teleporter_id"], name: "index_bookings_on_teleporter_id", using: :btree

  create_table "passengers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teleporters", force: true do |t|
    t.string   "name"
    t.integer  "departure_id"
    t.integer  "destination_id"
    t.datetime "departure_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teleporters", ["departure_id"], name: "index_teleporters_on_departure_id", using: :btree
  add_index "teleporters", ["destination_id"], name: "index_teleporters_on_destination_id", using: :btree

end
