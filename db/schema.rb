# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170312020306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "bookings", force: :cascade do |t|
    t.date     "from_date"
    t.boolean  "half_day"
    t.datetime "pick_up_time"
    t.string   "pick_up_location"
    t.integer  "passengers_number"
    t.text     "other_info"
    t.decimal  "fee"
    t.integer  "guest_id"
    t.integer  "host_id"
    t.datetime "requested_at"
    t.datetime "accepted_at"
    t.datetime "rejected_at"
    t.datetime "confirmed_at"
    t.datetime "cancelled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.date     "to_date"
    t.decimal  "additional_fuel_cost"
    t.string   "contact_name"
    t.string   "contact_number"
    t.integer  "itinerary_id"
    t.integer  "baggages_number"
    t.string   "car_type"
    t.string   "language"
    t.boolean  "tour_guidance"
    t.integer  "city_id"
  end

  add_index "bookings", ["city_id"], name: "index_bookings_on_city_id", using: :btree
  add_index "bookings", ["guest_id"], name: "index_bookings_on_guest_id", using: :btree
  add_index "bookings", ["host_id"], name: "index_bookings_on_host_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "drivers_count", default: 0
    t.string   "time_zone"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", unique: true, using: :btree

  create_table "destination_photos", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "priority",           default: 10
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "destination_photos", ["destination_id"], name: "index_destination_photos_on_destination_id", using: :btree

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "duration"
    t.boolean  "published"
    t.boolean  "recommended"
    t.integer  "priority",    default: 100
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "destinations", ["city_id"], name: "index_destinations_on_city_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "hotel_packages", force: :cascade do |t|
    t.string   "hotel_id"
    t.integer  "package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority",   default: 0
  end

  add_index "hotel_packages", ["hotel_id"], name: "index_hotel_packages_on_hotel_id", using: :btree
  add_index "hotel_packages", ["package_id"], name: "index_hotel_packages_on_package_id", using: :btree

  create_table "itineraries", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "multiple_days",            default: false
    t.integer  "duration"
    t.decimal  "price_per_person_minimum"
    t.boolean  "published"
    t.boolean  "recommended"
    t.integer  "priority",                 default: 100
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bookings_count",           default: 0
    t.decimal  "price_9_seater_basic"
    t.decimal  "price_7_seater_luxury"
    t.decimal  "price_7_seater_basic"
    t.decimal  "price_5_seater_luxury"
    t.decimal  "price_5_seater_basic"
    t.hstore   "languages"
    t.decimal  "price_tour_guidance"
    t.string   "slug"
  end

  add_index "itineraries", ["city_id"], name: "index_itineraries_on_city_id", using: :btree
  add_index "itineraries", ["slug"], name: "index_itineraries_on_slug", unique: true, using: :btree

  create_table "itinerary_comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "itinerary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itinerary_comments", ["itinerary_id"], name: "index_itinerary_comments_on_itinerary_id", using: :btree

  create_table "itinerary_destinations", force: :cascade do |t|
    t.text     "description"
    t.integer  "duration"
    t.integer  "order",          default: 10
    t.integer  "itinerary_id"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day",            default: 1
  end

  add_index "itinerary_destinations", ["destination_id"], name: "index_itinerary_destinations_on_destination_id", using: :btree
  add_index "itinerary_destinations", ["itinerary_id"], name: "index_itinerary_destinations_on_itinerary_id", using: :btree

  create_table "itinerary_photos", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "priority",           default: 10
    t.integer  "itinerary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itinerary_photos", ["itinerary_id"], name: "index_itinerary_photos_on_itinerary_id", using: :btree

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",                               null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                          null: false
    t.string   "scopes"
    t.string   "previous_refresh_token", default: "", null: false
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "original_price"
    t.decimal  "discounted_price"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "published"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
  end

  add_index "packages", ["merchant_id"], name: "index_packages_on_merchant_id", using: :btree

  create_table "user_photos", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "driver"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_photos", ["user_id"], name: "index_user_photos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "facebook_id"
    t.string   "email"
    t.string   "line_id"
    t.string   "wechat_id"
    t.string   "whatsapp_no"
    t.date     "birthdate"
    t.boolean  "is_male"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified_driver"
    t.integer  "years_driving_experience"
    t.text     "host_experience"
    t.string   "car_type"
    t.string   "car_make"
    t.integer  "seating_capacity"
    t.integer  "baggage_allowance"
    t.decimal  "full_day_rate"
    t.decimal  "half_day_rate"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
    t.hstore   "languages"
    t.string   "headline"
    t.integer  "city_id"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["facebook_id"], name: "index_users_on_facebook_id", unique: true, using: :btree

  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
end
