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

ActiveRecord::Schema.define(version: 20140718095325) do

  create_table "contact_infos", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "org"
    t.string   "email"
    t.string   "sa1"
    t.string   "sa2"
    t.string   "city"
    t.string   "sp"
    t.string   "pc"
    t.string   "cc"
    t.string   "phone"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "productid"
    t.integer  "quantity",   default: 1
    t.string   "riid"
    t.float    "duration",   default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paypal_notifications", force: true do |t|
    t.text     "params"
    t.string   "txn_id"
    t.string   "payer_id"
    t.string   "txn_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paypal_profiles", force: true do |t|
    t.string   "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_results", force: true do |t|
    t.string   "orderid"
    t.string   "roid"
    t.string   "riid"
    t.string   "resourceid"
    t.string   "status"
    t.string   "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", force: true do |t|
    t.string   "user_id"
    t.string   "dbpuser_id"
    t.string   "orderid"
    t.string   "domain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_info_id", default: 0
    t.integer  "order_item_id",   default: 0
    t.string   "domain_type"
    t.string   "password"
  end

end
