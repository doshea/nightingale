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

ActiveRecord::Schema.define(version: 20151128055448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "appointments", force: :cascade do |t|
    t.string   "subject"
    t.text     "description"
    t.datetime "scheduled_time"
    t.integer  "provider_id"
    t.integer  "patient_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.integer  "location_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "street_address"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "patients", force: :cascade do |t|
    t.date     "dob"
    t.string   "gender"
    t.string   "race"
    t.string   "ethnicity"
    t.string   "language"
    t.hstore   "allergies"
    t.string   "username"
    t.string   "image"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.string   "street_address"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "user_id"
    t.integer  "guardian_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "work_phone"
    t.string   "mobile_phone"
    t.string   "pager"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex",             default: "Not Set"
    t.string   "email",                                                  null: false
    t.string   "username",                                               null: false
    t.string   "image"
    t.string   "password_digest"
    t.string   "auth_token"
    t.boolean  "is_admin",        default: false
    t.string   "time_zone",       default: "Pacific Time (US & Canada)"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

end