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

ActiveRecord::Schema.define(version: 20170429110447) do

  create_table "attendees", force: :cascade do |t|
    t.text     "form_reply"
    t.boolean  "paid"
    t.integer  "member_id"
    t.integer  "event_instance_id"
    t.boolean  "canceled"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["event_instance_id"], name: "index_attendees_on_event_instance_id"
    t.index ["member_id"], name: "index_attendees_on_member_id"
  end

  create_table "event_instances", force: :cascade do |t|
    t.text     "form"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "address_id"
    t.text     "details"
    t.decimal  "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_event_instances_on_address_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
