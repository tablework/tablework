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

ActiveRecord::Schema.define(version: 20150202043900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.integer  "user_id"
    t.string   "token",      limit: 255
    t.string   "secret",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",   limit: 255
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description"
    t.string   "type_of_play", limit: 255
    t.integer  "age"
    t.string   "occupation",   limit: 255
    t.hstore   "fields",                   default: {}
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nationality",  limit: 255
    t.datetime "DOB"
    t.integer  "space_id"
    t.string   "gender",       limit: 255
    t.string   "image"
  end

  add_index "characters", ["space_id"], name: "index_characters_on_space_id", using: :btree
  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.integer  "notable_id"
    t.string   "notable_type", limit: 255
    t.text     "text"
    t.string   "image",        limit: 255
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "link_html"
  end

  add_index "notes", ["notable_id"], name: "index_notes_on_notable_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "answer",            limit: 255
    t.integer  "questionable_id"
    t.string   "questionable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scene_memberships", force: :cascade do |t|
    t.integer  "scene_id"
    t.integer  "user_id"
    t.string   "membership_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "character_id"
  end

  add_index "scene_memberships", ["character_id"], name: "index_scene_memberships_on_character_id", using: :btree
  add_index "scene_memberships", ["scene_id"], name: "index_scene_memberships_on_scene_id", using: :btree
  add_index "scene_memberships", ["user_id"], name: "index_scene_memberships_on_user_id", using: :btree

  create_table "scenes", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.integer  "scenable_id"
    t.string   "scenable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scenes", ["scenable_id"], name: "index_scenes_on_scenable_id", using: :btree

  create_table "space_memberships", force: :cascade do |t|
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",      limit: 255
    t.string   "token",      limit: 255
  end

  add_index "space_memberships", ["email"], name: "index_space_memberships_on_email", using: :btree
  add_index "space_memberships", ["space_id"], name: "index_space_memberships_on_space_id", using: :btree
  add_index "space_memberships", ["token"], name: "index_space_memberships_on_token", unique: true, using: :btree
  add_index "space_memberships", ["user_id"], name: "index_space_memberships_on_user_id", using: :btree

  create_table "spaces", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "type_of_play", limit: 255
    t.string   "description",  limit: 255
    t.integer  "director_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spaces", ["director_id"], name: "index_spaces_on_director_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.string   "profile_photo",          limit: 255
    t.string   "location",               limit: 255
    t.string   "gender",                 limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "occupation",             limit: 255
    t.string   "skillset",               limit: 255
    t.string   "eyecolor",               limit: 255
    t.date     "DOB"
    t.string   "mobile_phone",           limit: 255
    t.string   "website",                limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "image",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "scene_memberships", "characters"
  add_foreign_key "scene_memberships", "scenes"
  add_foreign_key "scene_memberships", "users"
end
