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

ActiveRecord::Schema.define(version: 20180328214940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "money_raised", default: 0.0
    t.integer "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "image_file_file_name"
    t.string "image_file_content_type"
    t.integer "image_file_file_size"
    t.datetime "image_file_updated_at"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "pledges", force: :cascade do |t|
    t.float "money"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.bigint "user_id"
    t.bigint "campaign_id"
    t.index ["campaign_id"], name: "index_pledges_on_campaign_id"
    t.index ["user_id"], name: "index_pledges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "password_hash"
    t.string "password_salt"
    t.string "profile_image_file_file_name"
    t.string "profile_image_file_content_type"
    t.integer "profile_image_file_file_size"
    t.datetime "profile_image_file_updated_at"
    t.index ["nickname", "email"], name: "index_users_on_nickname_and_email", unique: true
    t.index ["token"], name: "index_users_on_token"
  end

  add_foreign_key "campaigns", "users"
  add_foreign_key "pledges", "campaigns"
  add_foreign_key "pledges", "users"
end
