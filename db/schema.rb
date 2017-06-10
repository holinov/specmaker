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

ActiveRecord::Schema.define(version: 20170609223206) do

  create_table "entries", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "entry_info_id"
    t.integer  "amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["entry_info_id"], name: "index_entries_on_entry_info_id"
    t.index ["project_id"], name: "index_entries_on_project_id"
  end

  create_table "entry_infos", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_entry_infos_on_group_id"
  end

  create_table "field_infos", force: :cascade do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.string   "unit_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.integer  "field_info_id"
    t.integer  "entry_info_id"
    t.float    "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["entry_info_id"], name: "index_fields_on_entry_info_id"
    t.index ["field_info_id"], name: "index_fields_on_field_info_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.string   "full_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_on_group_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_infos", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.string   "units"
    t.decimal  "price",         precision: 8, scale: 2
    t.integer  "entry_info_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["entry_info_id"], name: "index_work_infos_on_entry_info_id"
  end

end
