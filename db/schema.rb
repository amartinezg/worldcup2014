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

ActiveRecord::Schema.define(version: 20140619034903) do

  create_table "forecasts", force: true do |t|
    t.string   "group"
    t.string   "forecast1"
    t.string   "forecast2"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
  end

  create_table "games", force: true do |t|
    t.string   "team1",           limit: 3
    t.string   "team2",           limit: 3
    t.date     "play_at"
    t.string   "score1",          limit: 1
    t.string   "score2",          limit: 1
    t.string   "result",          limit: 1
    t.boolean  "processed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "round"
    t.boolean  "processed_excel"
  end

  create_table "scores", force: true do |t|
    t.integer  "points"
    t.string   "reason"
    t.integer  "user_id"
    t.integer  "forecast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_of_bet"
  end

  create_table "setup", force: true do |t|
    t.text     "groups"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "finalists"
    t.text     "teams"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
