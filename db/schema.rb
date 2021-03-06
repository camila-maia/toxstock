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

ActiveRecord::Schema.define(version: 20161023121755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "glasswares", force: true do |t|
    t.string  "ufsc_id",  limit: 1000
    t.string  "capacity"
    t.integer "quantity"
  end

  create_table "item_glasswares", force: true do |t|
    t.string "current_quantity"
  end

  create_table "item_reagents", force: true do |t|
    t.date   "shelf_life"
    t.string "conservation"
    t.string "current_volume"
    t.string "current_weight"
  end

  create_table "item_standard_solutions", force: true do |t|
    t.date "shelf_life"
  end

  create_table "item_utensils", force: true do |t|
    t.integer "current_quantity"
  end

  create_table "items", force: true do |t|
    t.integer  "material_id"
    t.integer  "stock_id"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "items", ["material_id"], name: "index_items_on_material_id", using: :btree
  add_index "items", ["stock_id"], name: "index_items_on_stock_id", using: :btree

  create_table "laboratories", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "user_id"
  end

  create_table "laboratory_users", force: true do |t|
    t.integer "laboratory_id"
    t.integer "user_id"
  end

  create_table "materials", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reagents", force: true do |t|
    t.string "physical_state"
    t.string "ufsc_id",        limit: 50
    t.string "cas"
    t.string "purity"
    t.string "synonym"
    t.string "brand"
    t.string "volume"
    t.string "weight"
    t.string "form"
  end

  create_table "standard_solutions", force: true do |t|
    t.string "concentration"
  end

  create_table "stocks", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "laboratory_id"
  end

  add_index "stocks", ["laboratory_id"], name: "index_stocks_on_laboratory_id", using: :btree
  add_index "stocks", ["user_id"], name: "index_stocks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "current_lab_id"
    t.string   "locale"
  end

  add_index "users", ["current_lab_id"], name: "index_users_on_current_lab_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "utensils", force: true do |t|
    t.string  "ufsc_id",  limit: 1000
    t.integer "quantity"
  end

end
