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

ActiveRecord::Schema.define(version: 20141129040730) do

  create_table "clockwork_database_events", force: true do |t|
    t.integer  "frequency_quantity"
    t.integer  "frequency_period_id"
    t.string   "at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clockwork_database_events", ["frequency_period_id"], name: "index_clockwork_database_events_on_frequency_period_id"

  create_table "frequency_periods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pin_numbers", force: true do |t|
    t.string   "name"
    t.integer  "transmitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pin_numbers", ["transmitter_id"], name: "index_pin_numbers_on_transmitter_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["tag_id"], name: "index_posts_on_tag_id"

  create_table "records", force: true do |t|
    t.integer  "time_stamp"
    t.float    "value"
    t.integer  "sensor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "records", ["sensor_id", "time_stamp"], name: "index_records_on_sensor_id_and_time_stamp"
  add_index "records", ["sensor_id"], name: "index_records_on_sensor_id"

  create_table "sensors", force: true do |t|
    t.string   "name"
    t.string   "formula"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pin_number_id"
    t.string   "lower"
    t.boolean  "led",           default: false
  end

  add_index "sensors", ["pin_number_id"], name: "index_sensors_on_pin_number_id"
  add_index "sensors", ["user_id"], name: "index_sensors_on_user_id"
  add_index "sensors", ["user_id"], name: "index_sensors_on_user_id_and_transmitter_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transmitters", force: true do |t|
    t.string   "name"
    t.string   "transmitter_token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transmitters", ["user_id", "transmitter_token"], name: "index_transmitters_on_user_id_and_transmitter_token"
  add_index "transmitters", ["user_id"], name: "index_transmitters_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["token"], name: "index_users_on_token"

end
