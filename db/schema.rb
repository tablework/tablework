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

ActiveRecord::Schema.define(version: 20150806211516) do

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

  create_table "messages", force: :cascade do |t|
    t.text     "text"
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["space_id"], name: "index_messages_on_space_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

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
    t.integer  "user_id"
  end

  add_index "notes", ["notable_id"], name: "index_notes_on_notable_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "promotions", force: :cascade do |t|
    t.string   "code"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer  "character_id"
  end

  add_index "scene_memberships", ["character_id"], name: "index_scene_memberships_on_character_id", using: :btree
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
    t.string   "image"
  end

  add_index "spaces", ["director_id"], name: "index_spaces_on_director_id", using: :btree

  create_table "subscription_plans", force: :cascade do |t|
    t.integer  "character_limit"
    t.boolean  "owned_space",     default: false
    t.string   "name"
    t.string   "state"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "expires_on"
    t.string   "uuid"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "subscription_plan_id"
  end

  add_index "subscriptions", ["subscription_plan_id"], name: "index_subscriptions_on_subscription_plan_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "user_payments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "payment_type"
    t.string   "plantype"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "payment_id"
    t.string   "status"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
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
    t.boolean  "show_intro_1",           default: true
    t.boolean  "show_intro_2",           default: false
    t.boolean  "show_intro_3",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "messages", "spaces"
  add_foreign_key "messages", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "scene_memberships", "characters"
  add_foreign_key "scene_memberships", "scenes"
  add_foreign_key "scene_memberships", "users"
  add_foreign_key "subscriptions", "subscription_plans"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_payments", "users"
end
