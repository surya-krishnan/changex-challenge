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

ActiveRecord::Schema[7.0].define(version: 2022_12_02_112308) do
  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.text "overview"
    t.integer "funding"
    t.integer "project_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_applicants_on_name", unique: true
    t.index ["project_id"], name: "index_applicants_on_project_id"
  end

  create_table "funds", force: :cascade do |t|
    t.string "title"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_funds_on_title", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.integer "fund_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "payment_date"
    t.index ["fund_id"], name: "index_projects_on_fund_id"
    t.index ["title"], name: "index_projects_on_title", unique: true
  end

  add_foreign_key "applicants", "projects"
  add_foreign_key "projects", "funds"
end
