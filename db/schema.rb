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

ActiveRecord::Schema[7.0].define(version: 2023_07_24_031049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badge_permissions", force: :cascade do |t|
    t.string "token"
    t.bigint "badge_id"
    t.string "name"
    t.text "canonical_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_badge_permissions_on_badge_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id"
    t.integer "language", default: 0, null: false
    t.datetime "closed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.text "body"
    t.text "slug"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foos", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "token"
    t.bigint "chat_id"
    t.integer "role", default: 0, null: false
    t.text "content", null: false
    t.boolean "is_prompt", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "organization_badges", force: :cascade do |t|
    t.string "token"
    t.bigint "organization_id"
    t.bigint "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_organization_badges_on_badge_id"
    t.index ["organization_id"], name: "index_organization_badges_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "token"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summaries", force: :cascade do |t|
    t.string "token"
    t.bigint "chat_id"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_summaries_on_chat_id"
  end

  create_table "user_organization_badges", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id"
    t.bigint "organization_badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_badge_id"], name: "index_user_organization_badges_on_organization_badge_id"
    t.index ["user_id"], name: "index_user_organization_badges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "token"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  add_foreign_key "badge_permissions", "badges"
  add_foreign_key "chats", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "organization_badges", "badges"
  add_foreign_key "organization_badges", "organizations"
  add_foreign_key "summaries", "chats"
  add_foreign_key "user_organization_badges", "organization_badges"
  add_foreign_key "user_organization_badges", "users"
  add_foreign_key "users", "organizations"
end
