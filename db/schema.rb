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

ActiveRecord::Schema.define(:version => 20111201050100) do

  create_table "games", :force => true do |t|
    t.text     "team1_classifier"
    t.text     "team2_classifier"
    t.date     "game_day"
    t.string   "team1_name"
    t.string   "team2_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "since_id"
    t.integer  "team1_pos",        :default => 0
    t.integer  "team1_neg",        :default => 0
    t.integer  "team2_pos",        :default => 0
    t.integer  "team2_neg",        :default => 0
  end

end
