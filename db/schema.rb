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

ActiveRecord::Schema[7.0].define(version: 2025_08_06_152526) do
  create_table "projects", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "project"
    t.string "client"
    t.integer "rewards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "url"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "project_id", null: false
    t.string "task"
    t.date "due_date"
    t.string "status"
    t.string "task_url"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_processes_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end

  add_foreign_key "projects", "users"
  add_foreign_key "tasks", "projects"
end
