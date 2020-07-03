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

ActiveRecord::Schema.define(version: 2020_07_03_150810) do

  create_table "districts", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guard_employees", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "guard_id", null: false
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_guard_employees_on_employee_id"
    t.index ["guard_id"], name: "index_guard_employees_on_guard_id"
  end

  create_table "guards", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "date"
    t.integer "start"
    t.integer "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "district_id", null: false
    t.index ["district_id"], name: "index_guards_on_district_id"
  end

  create_table "houses", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "address"
    t.integer "address_number"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "customer_id"
    t.bigint "district_id", null: false
    t.index ["customer_id"], name: "index_houses_on_customer_id"
    t.index ["district_id"], name: "index_houses_on_district_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "user_type"
    t.string "phone1"
    t.string "phone2"
    t.boolean "admin"
  end

  add_foreign_key "guard_employees", "guards"
  add_foreign_key "guard_employees", "users", column: "employee_id"
  add_foreign_key "guards", "districts"
  add_foreign_key "houses", "districts"
  add_foreign_key "houses", "users", column: "customer_id"
end
