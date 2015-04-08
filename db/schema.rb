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

ActiveRecord::Schema.define(version: 20150407155007) do

  create_table "claims", force: :cascade do |t|
    t.integer  "donation_id"
    t.integer  "recipient_id"
    t.boolean  "approved",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "donations", force: :cascade do |t|
    t.string   "name"
    t.integer  "donor_id"
    t.text     "description"
    t.text     "requirements"
    t.boolean  "auto_confirm", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "expiration"
  end

  create_table "donors", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "organization_id"
    t.string   "role"
    t.string   "contact_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donors", ["email"], name: "index_donors_on_email", unique: true
  add_index "donors", ["reset_password_token"], name: "index_donors_on_reset_password_token", unique: true

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "affiliation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipients", ["email"], name: "index_recipients_on_email", unique: true
  add_index "recipients", ["reset_password_token"], name: "index_recipients_on_reset_password_token", unique: true

end
