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

ActiveRecord::Schema.define(version: 20160928165528) do

  create_table "deposites", force: :cascade do |t|
    t.integer  "investor_id"
    t.integer  "period"
    t.integer  "payment_pie_id"
    t.float    "sum"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "rate"
  end

  create_table "entities", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investors", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_pies", force: :cascade do |t|
    t.float    "expected_revenue"
    t.float    "real_revenue"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "payments", force: :cascade do |t|
    t.float    "sum",            default: 0.0, null: false
    t.integer  "entity_id",                    null: false
    t.integer  "month",                        null: false
    t.integer  "investor_id",                  null: false
    t.float    "total_month",                  null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "payment_pie_id"
  end

end
