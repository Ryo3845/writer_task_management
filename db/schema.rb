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

ActiveRecord::Schema[7.0].define(version: 2024_08_07_194854) do
  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deadlines", force: :cascade do |t|
    t.date "due_date"
    t.integer "task_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_group_id"], name: "index_deadlines_on_task_group_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.decimal "compensation"
    t.string "url"
    t.text "note"
    t.float "total_working_hours"
    t.decimal "hourly_rate"
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "task_groups", force: :cascade do |t|
    t.string "group_type"
    t.string "status"
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_task_groups_on_project_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.integer "task_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_group_id"], name: "index_tasks_on_task_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "deadlines", "task_groups"
  add_foreign_key "projects", "clients"
  add_foreign_key "projects", "users"
  add_foreign_key "task_groups", "projects"
  add_foreign_key "tasks", "task_groups"
end
