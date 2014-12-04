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

ActiveRecord::Schema.define(version: 20141204205735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitations", id: false, force: true do |t|
    t.string   "user_email"
    t.string   "invitation_token",                      null: false
    t.boolean  "reservation_completed", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["invitation_token"], name: "index_invitations_on_invitation_token", unique: true, using: :btree

  create_table "reservations", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.date     "preferred_housing_date"
    t.text     "additional_questions"
    t.text     "amenities",              default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip_address"
    t.string   "invitation_id"
  end

end
