# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_05_034627) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bad_events", force: :cascade do |t|
    t.text "body"
    t.bigint "memory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memory_id"], name: "index_bad_events_on_memory_id"
  end

  create_table "good_events", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "date", null: false
    t.bigint "memory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memory_id"], name: "index_good_events_on_memory_id"
  end

  create_table "memories", force: :cascade do |t|
    t.string "bad_image", null: false
    t.string "good_image"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.index ["user_id"], name: "index_memories_on_user_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.text "bad_prompt", null: false
    t.text "good_prompt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "question", null: false
    t.text "bad_negative_prompt"
    t.text "good_negative_prompt"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bad_events", "memories"
  add_foreign_key "good_events", "memories"
  add_foreign_key "memories", "users"
end
