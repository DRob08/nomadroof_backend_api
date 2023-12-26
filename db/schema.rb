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

ActiveRecord::Schema[7.0].define(version: 2023_12_21_225615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.decimal "latitude"
    t.decimal "longitude"
    t.text "features_and_amenities"
    t.integer "max_guests"
    t.boolean "availability"
    t.decimal "monthly_price"
    t.decimal "weekly_price"
    t.decimal "daily_price"
    t.string "status"
    t.date "booked_start_date"
    t.date "booked_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cat_property_id"
    t.decimal "extra_price_per_guest", default: "0.0"
    t.integer "size", default: 0
    t.integer "bedrooms", default: 0
    t.integer "bathrooms", default: 0
    t.integer "rooms", default: 0
    t.decimal "city_fee", default: "0.0"
    t.decimal "cleaning_fee", default: "0.0"
    t.boolean "verified", default: false
    t.string "country"
    t.string "city"
    t.text "about_neighborhood"
    t.integer "min_booking_months", default: 0
    t.time "check_in_hour", default: "2000-01-01 12:00:00"
    t.time "check_out_hour", default: "2000-01-01 12:00:00"
    t.index ["cat_property_id"], name: "index_properties_on_cat_property_id"
    t.index ["name"], name: "index_properties_on_name", unique: true
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_property_categories_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "country_of_origin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.integer "role", default: 0
    t.string "whatsapp_number"
    t.string "languages_spoken"
    t.text "about_me"
    t.date "dob"
    t.string "instagram_handle"
    t.string "twitter_handle"
    t.string "linkedin_handle"
  end

  add_foreign_key "properties", "property_categories", column: "cat_property_id"
  add_foreign_key "properties", "users"
end
