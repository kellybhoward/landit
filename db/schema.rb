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

ActiveRecord::Schema.define(version: 20160107071722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: true do |t|
    t.integer  "user_id"
    t.integer  "state_id"
    t.string   "company_name"
    t.string   "company_url"
    t.string   "position"
    t.string   "city"
    t.string   "application_url"
    t.text     "mission"
    t.text     "notes"
    t.boolean  "write_cv"
    t.integer  "est_salary"
    t.boolean  "review_resume"
    t.boolean  "apply"
    t.datetime "apply_time"
    t.boolean  "confirmation"
    t.boolean  "interview"
    t.datetime "interview_date"
    t.text     "interview_notes"
    t.boolean  "offer"
    t.integer  "salary"
    t.text     "offer_notes"
    t.date     "start_date"
    t.boolean  "accept"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["state_id"], name: "index_jobs_on_state_id", using: :btree
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "state_name"
    t.string   "state_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
