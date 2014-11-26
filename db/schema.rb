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

ActiveRecord::Schema.define(version: 20141126034605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type_of_play"
    t.integer  "age"
    t.string   "occupation"
    t.hstore   "fields",       default: {}
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  limit: nil, default: "", null: false
    t.string   "encrypted_password",     limit: nil, default: "", null: false
    t.string   "reset_password_token",   limit: nil
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: nil
    t.string   "profile_photo",          limit: nil
    t.string   "location",               limit: nil
    t.string   "gender",                 limit: nil
    t.string   "provider"
    t.string   "uid"
    t.string   "occupation"
    t.string   "skillset"
    t.string   "eyecolor"
    t.date     "DOB"
    t.string   "mobile_phone"
    t.string   "website"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
