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

ActiveRecord::Schema.define(version: 2019_01_16_195847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_admin_managed_resources", id: :serial, force: :cascade do |t|
    t.string "class_name", null: false
    t.string "action", null: false
    t.string "name"
    t.index ["class_name", "action", "name"], name: "active_admin_managed_resources_index", unique: true
  end

  create_table "active_admin_permissions", id: :serial, force: :cascade do |t|
    t.integer "managed_resource_id", null: false
    t.integer "role", limit: 2, default: 0, null: false
    t.integer "state", limit: 2, default: 0, null: false
    t.index ["managed_resource_id", "role"], name: "active_admin_permissions_index", unique: true
  end

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "street"
    t.string "street_number"
    t.string "zip_code"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.string "district"
    t.index ["member_id"], name: "index_addresses_on_member_id"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", limit: 2, default: 0, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "attendees", id: :serial, force: :cascade do |t|
    t.text "form_reply"
    t.boolean "paid"
    t.integer "member_id"
    t.integer "event_instance_id"
    t.boolean "canceled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.boolean "terms_accepted"
    t.index ["event_instance_id"], name: "index_attendees_on_event_instance_id"
    t.index ["member_id"], name: "index_attendees_on_member_id"
  end

  create_table "event_instances", id: :serial, force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "address_id"
    t.text "details"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.string "image_url"
    t.text "description"
    t.string "name"
    t.bigint "questionnaire_id"
    t.index ["address_id"], name: "index_event_instances_on_address_id"
    t.index ["event_id"], name: "index_event_instances_on_event_id"
    t.index ["questionnaire_id"], name: "index_event_instances_on_questionnaire_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.boolean "is_visible"
  end

  create_table "families", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaders", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "event_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_instance_id"], name: "index_leaders_on_event_instance_id"
    t.index ["member_id"], name: "index_leaders_on_member_id"
  end

  create_table "members", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "birthday"
    t.string "email"
    t.string "phone1"
    t.string "phone2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "family_id"
    t.integer "address_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "status", default: 0
    t.integer "created_by", default: 1
    t.datetime "discarded_at"
    t.datetime "status_changed_at"
    t.index ["address_id"], name: "index_members_on_address_id"
    t.index ["discarded_at"], name: "index_members_on_discarded_at"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["family_id"], name: "index_members_on_family_id"
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "members_members", id: false, force: :cascade do |t|
    t.integer "member_id", null: false
  end

  create_table "oauth_access_grants", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "option_answers", id: :serial, force: :cascade do |t|
    t.integer "question_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "attendee_id"
    t.index ["attendee_id"], name: "index_option_answers_on_attendee_id"
    t.index ["question_option_id"], name: "index_option_answers_on_question_option_id"
  end

  create_table "question_answers", force: :cascade do |t|
    t.bigint "question_id"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "attendee_id"
    t.index ["attendee_id"], name: "index_question_answers_on_attendee_id"
    t.index ["question_id"], name: "index_question_answers_on_question_id"
  end

  create_table "question_groups", id: :serial, force: :cascade do |t|
    t.integer "questionnaire_id"
    t.string "title"
    t.text "subtitle"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_question_groups_on_questionnaire_id"
  end

  create_table "question_options", id: :serial, force: :cascade do |t|
    t.integer "question_id"
    t.string "title"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questionnaires", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.integer "question_group_id"
    t.string "title"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "answer_type"
    t.index ["question_group_id"], name: "index_questions_on_question_group_id"
  end

  add_foreign_key "attendees", "event_instances"
  add_foreign_key "attendees", "members"
  add_foreign_key "event_instances", "addresses"
  add_foreign_key "event_instances", "events"
  add_foreign_key "event_instances", "questionnaires"
  add_foreign_key "leaders", "event_instances"
  add_foreign_key "leaders", "members"
  add_foreign_key "oauth_access_grants", "admin_users", column: "resource_owner_id"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "admin_users", column: "resource_owner_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "option_answers", "attendees"
  add_foreign_key "option_answers", "question_options"
  add_foreign_key "question_answers", "attendees"
  add_foreign_key "question_answers", "questions"
  add_foreign_key "question_groups", "questionnaires"
  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "question_groups"
end
