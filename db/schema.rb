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

ActiveRecord::Schema.define(version: 20150228182015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commits", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "message"
    t.date     "date",       null: false
    t.string   "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "commits", ["user_id"], name: "index_commits_on_user_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",                          null: false
    t.string   "description",                    null: false
    t.date     "start_date",                     null: false
    t.date     "end_date",                       null: false
    t.integer  "daily_quantity", default: 1
    t.boolean  "completed",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "provider",      null: false
    t.string   "uid",           null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "email"
    t.string   "twitter"
    t.string   "thumbnail_url"
  end

end
