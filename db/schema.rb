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

ActiveRecord::Schema.define(version: 2021_06_02_071617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.integer "offer_amount"
    t.text "buyer_comment"
    t.text "seller_comment"
    t.boolean "offer_accepted"
    t.bigint "user_id", null: false
    t.bigint "property_listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_listing_id"], name: "index_offers_on_property_listing_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "property_listings", force: :cascade do |t|
    t.string "title"
    t.string "sub_title"
    t.text "description"
    t.string "location"
    t.string "property_type"
    t.float "listing_price"
    t.integer "number_of_bedrooms"
    t.integer "number_of_bathrooms"
    t.integer "property_size"
    t.integer "number_of_parking_spaces"
    t.jsonb "amenities"
    t.integer "year_built"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_property_listings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "offers", "property_listings"
  add_foreign_key "offers", "users"
  add_foreign_key "property_listings", "users"
end
