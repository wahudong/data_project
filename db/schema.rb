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

ActiveRecord::Schema.define(version: 2019_10_07_142403) do

  create_table "electoral_wards", force: :cascade do |t|
    t.string "name"
    t.string "mla_name"
    t.string "mla_add"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "neighbourhoods", force: :cascade do |t|
    t.string "name"
    t.string "school_division"
    t.string "number_of_hospital"
    t.string "integer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_requests", force: :cascade do |t|
    t.datetime "date_time"
    t.string "service_area"
    t.string "service_request"
    t.string "latitude"
    t.string "longitude"
    t.integer "Electoral_ward_id", null: false
    t.integer "Neighbourhood_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Electoral_ward_id"], name: "index_service_requests_on_Electoral_ward_id"
    t.index ["Neighbourhood_id"], name: "index_service_requests_on_Neighbourhood_id"
  end

  add_foreign_key "service_requests", "Electoral_wards"
  add_foreign_key "service_requests", "Neighbourhoods"
end
