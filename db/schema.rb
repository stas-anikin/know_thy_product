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

ActiveRecord::Schema.define(version: 2021_02_16_013655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "department_roles_assignments", force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "role_id", null: false
    t.index ["department_id"], name: "index_department_roles_assignments_on_department_id"
    t.index ["role_id"], name: "index_department_roles_assignments_on_role_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
  end

  create_table "roles", force: :cascade do |t|
    t.string "position"
    t.bigint "user_id", null: false
    t.bigint "department_id", null: false
    t.index ["department_id"], name: "index_roles_on_department_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "user_roles_assignment", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.index ["role_id"], name: "index_user_roles_assignment_on_role_id"
    t.index ["user_id"], name: "index_user_roles_assignment_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "stard_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin", default: false
    t.boolean "is_superuser", default: false
  end

  add_foreign_key "department_roles_assignments", "departments"
  add_foreign_key "department_roles_assignments", "roles"
  add_foreign_key "roles", "departments"
  add_foreign_key "roles", "users"
  add_foreign_key "user_roles_assignment", "roles"
  add_foreign_key "user_roles_assignment", "users"
end
