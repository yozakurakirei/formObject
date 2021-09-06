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

ActiveRecord::Schema.define(version: 2021_09_03_163115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "place"
    t.string "place_remark"
    t.date "start"
    t.date "finish"
    t.time "time"
    t.integer "salary"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "name_kana"
    t.index ["company_id"], name: "index_admins_on_company_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "birth_place"
    t.date "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.date "publish_date"
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "details", force: :cascade do |t|
    t.integer "payment"
    t.text "remark"
    t.bigint "taigu_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_details_on_company_id"
    t.index ["taigu_id"], name: "index_details_on_taigu_id"
  end

  create_table "kaishas", force: :cascade do |t|
    t.string "neme"
    t.string "name_kana"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taigus", force: :cascade do |t|
    t.integer "salary"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_taigus_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "admins", "companies"
  add_foreign_key "books", "authors"
  add_foreign_key "details", "companies"
  add_foreign_key "details", "taigus"
  add_foreign_key "taigus", "users"
end
