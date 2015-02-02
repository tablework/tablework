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

ActiveRecord::Schema.define(version: 20150202022201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type_of_play"
    t.integer  "age"
    t.string   "occupation"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nationality"
    t.datetime "DOB"
    t.integer  "space_id"
    t.string   "gender"
    t.string   "image"
  end

  add_index "characters", ["space_id"], name: "index_characters_on_space_id", using: :btree
  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.integer  "notable_id"
    t.string   "notable_type"
    t.text     "text"
    t.string   "image"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "link_html"
  end

  add_index "notes", ["notable_id"], name: "index_notes_on_notable_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "answer"
    t.integer  "questionable_id"
    t.string   "questionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scene_memberships", force: :cascade do |t|
    t.integer  "scene_id"
    t.integer  "user_id"
    t.string   "membership_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "scene_memberships", ["scene_id"], name: "index_scene_memberships_on_scene_id", using: :btree
  add_index "scene_memberships", ["user_id"], name: "index_scene_memberships_on_user_id", using: :btree

  create_table "scenes", force: :cascade do |t|
    t.string   "title"
    t.integer  "scenable_id"
    t.string   "scenable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scenes", ["scenable_id"], name: "index_scenes_on_scenable_id", using: :btree

  create_table "space_memberships", force: :cascade do |t|
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "token"
  end

  add_index "space_memberships", ["email"], name: "index_space_memberships_on_email", using: :btree
  add_index "space_memberships", ["space_id"], name: "index_space_memberships_on_space_id", using: :btree
  add_index "space_memberships", ["token"], name: "index_space_memberships_on_token", unique: true, using: :btree
  add_index "space_memberships", ["user_id"], name: "index_space_memberships_on_user_id", using: :btree

  create_table "spaces", force: :cascade do |t|
    t.string   "name"
    t.string   "type_of_play"
    t.string   "description"
    t.integer  "director_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spaces", ["director_id"], name: "index_spaces_on_director_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "profile_photo"
    t.string   "location"
    t.string   "gender"
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
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "scene_memberships", "scenes"
  add_foreign_key "scene_memberships", "users"
end
