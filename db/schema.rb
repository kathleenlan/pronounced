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

ActiveRecord::Schema.define(version: 20170520211545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abuse_reports", force: :cascade do |t|
    t.integer  "pronunciation_id",       null: false
    t.integer  "reported_by_id",         null: false
    t.integer  "abuse_report_reason_id", null: false
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "abuse_report_status"
    t.index ["abuse_report_reason_id"], name: "index_abuse_reports_on_abuse_report_reason_id", using: :btree
    t.index ["pronunciation_id"], name: "index_abuse_reports_on_pronunciation_id", using: :btree
    t.index ["reported_by_id"], name: "index_abuse_reports_on_reported_by_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_languages_on_name", unique: true, using: :btree
  end

  create_table "pronounceables", force: :cascade do |t|
    t.string  "name",                    null: false
    t.integer "language_id",             null: false
    t.integer "view_count",  default: 0
    t.index ["language_id"], name: "index_pronounceables_on_language_id", using: :btree
    t.index ["name", "language_id"], name: "index_pronounceables_on_name_and_language_id", unique: true, using: :btree
  end

  create_table "pronunciations", force: :cascade do |t|
    t.integer  "user_id",                                 null: false
    t.integer  "pronounceable_id",                        null: false
    t.string   "audio_file_file_name"
    t.string   "audio_file_content_type"
    t.integer  "audio_file_file_size"
    t.datetime "audio_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "disabled",                default: false
    t.index ["pronounceable_id"], name: "index_pronunciations_on_pronounceable_id", using: :btree
    t.index ["user_id", "pronounceable_id"], name: "index_pronunciations_on_user_id_and_pronounceable_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_pronunciations_on_user_id", using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "type",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "abuse_reports", "pronunciations"
  add_foreign_key "abuse_reports", "properties", column: "abuse_report_reason_id"
  add_foreign_key "abuse_reports", "users", column: "reported_by_id"
  add_foreign_key "pronounceables", "languages"
  add_foreign_key "pronunciations", "pronounceables"
  add_foreign_key "pronunciations", "users"
end
