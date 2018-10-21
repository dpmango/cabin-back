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

ActiveRecord::Schema.define(version: 20181014103930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "onboardings", force: :cascade do |t|
    t.string "onboarding_id"
    t.string "company_uen"
    t.string "company_name"
    t.string "company_activity"
    t.string "company_addres"
    t.string "company_revenue"
    t.string "consumers_list"
    t.string "suppliers_list"
    t.string "payments_to_list"
    t.string "payments_from_list"
    t.string "paidup_capital"
    t.string "company_relations"
    t.string "paidup_capital_origins"
    t.string "shareholders_individulas"
    t.string "shareholders_corporate"
    t.boolean "ispending", default: true
    t.boolean "isproduction", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "other_beneficiaries"
    t.boolean "other_controllers"
    t.string "name"
    t.string "designation"
    t.string "phone"
    t.string "email"
    t.string "a_shortname"
    t.string "a_companycode"
    t.string "a_corpsecretary"
    t.string "a_accounting"
    t.string "a_corpsecretary_name"
    t.string "a_corpsecretary_id"
    t.integer "a_status", default: 1
    t.string "a_action"
    t.text "a_notes"
    t.string "a_companyaddress1"
    t.string "a_companyaddress2"
    t.string "a_companypostal"
    t.string "a_acra_address"
    t.string "a_acra_incorporationdate"
    t.boolean "isCompleated", default: false
    t.text "shareholders_individulas_array"
    t.text "shareholders_corporate_array"
    t.datetime "a_date_fye"
    t.datetime "a_date_agm"
    t.datetime "a_date_renewal"
  end

  create_table "signup_leads", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "phone"
    t.string "company_industry"
    t.string "company_old"
    t.string "company_employees"
    t.date "meeting_date"
    t.string "meeting_time"
    t.boolean "ispending", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pricing_plan"
    t.string "pricing_options"
    t.boolean "isfollowup", default: true
    t.boolean "email_instead", default: false
    t.boolean "isproduction", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
