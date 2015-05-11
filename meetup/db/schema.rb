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

ActiveRecord::Schema.define(version: 20150511090912) do

  create_table "attendens", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "attendens", ["event_id"], name: "index_attendens_on_event_id", using: :btree
  add_index "attendens", ["user_id"], name: "index_attendens_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.text     "desc",                  limit: 65535
    t.string   "location",              limit: 255
    t.datetime "date"
    t.integer  "group_id",              limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "ev_image_file_name",    limit: 255
    t.string   "ev_image_content_type", limit: 255
    t.integer  "ev_image_file_size",    limit: 4
    t.datetime "ev_image_updated_at"
    t.string   "long",                  limit: 255
    t.string   "lat",                   limit: 255
  end

  add_index "events", ["group_id"], name: "index_events_on_group_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "location",             limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id",              limit: 4
    t.string   "g_image_file_name",    limit: 255
    t.string   "g_image_content_type", limit: 255
    t.integer  "g_image_file_size",    limit: 4
    t.datetime "g_image_updated_at"
    t.text     "description",          limit: 65535
    t.string   "MembersName",          limit: 255
    t.string   "lang",                 limit: 255
    t.string   "lat",                  limit: 255
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "interest",   limit: 255
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "interests", ["group_id"], name: "index_interests_on_group_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "photos", ["group_id"], name: "index_photos_on_group_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "email",              limit: 255
    t.string   "password",           limit: 255
    t.boolean  "is_admin",           limit: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_foreign_key "attendens", "events"
  add_foreign_key "attendens", "users"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "groups"
  add_foreign_key "groups", "users"
  add_foreign_key "interests", "groups"
  add_foreign_key "members", "groups"
  add_foreign_key "members", "users"
  add_foreign_key "photos", "groups"
end
