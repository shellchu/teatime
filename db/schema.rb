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

ActiveRecord::Schema.define(version: 20141217155935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beverages", force: true do |t|
    t.integer  "shop_id"
    t.string   "name"
    t.boolean  "hot"
    t.boolean  "cold"
    t.string   "size"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "beverages", ["shop_id"], name: "index_beverages_on_shop_id", using: :btree

  create_table "events", force: true do |t|
    t.integer  "owner_id"
    t.integer  "shop_id"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["owner_id"], name: "index_events_on_owner_id", using: :btree
  add_index "events", ["shop_id"], name: "index_events_on_shop_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "beverage_id"
    t.integer  "event_id"
    t.string   "ice"
    t.string   "sugar"
    t.boolean  "hot"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["beverage_id"], name: "index_orders_on_beverage_id", using: :btree
  add_index "orders", ["event_id"], name: "index_orders_on_event_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "shops", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
