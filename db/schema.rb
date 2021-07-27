# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_27_032644) do

  create_table "packages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", default: "untitled", null: false
    t.string "main_assembly", default: "error", null: false
    t.string "homepage"
    t.string "description"
    t.string "description_short", default: "error", null: false
    t.string "tags"
    t.integer "uuid", default: -1, null: false
    t.string "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["name"], name: "index_packages_on_name", unique: true
    t.index ["user_id"], name: "index_packages_on_user_id"
    t.index ["uuid"], name: "index_packages_on_uuid", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 2, null: false
  end

  create_table "versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "download_url", null: false
    t.string "update_note", null: false
    t.string "update_note_short", null: false
    t.string "release_datetime", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "package_id"
    t.index ["package_id"], name: "index_versions_on_package_id"
  end

  add_foreign_key "packages", "users"
  add_foreign_key "versions", "packages"
end
