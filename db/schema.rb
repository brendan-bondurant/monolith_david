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

ActiveRecord::Schema[7.1].define(version: 2024_03_13_142451) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "bidder_id", null: false
    t.float "bid_amount"
    t.datetime "bid_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bidder_id"], name: "index_bids_on_bidder_id"
    t.index ["item_id"], name: "index_bids_on_item_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "from_user_id", null: false
    t.bigint "to_user_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "feedback_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_user_id"], name: "index_feedbacks_on_from_user_id"
    t.index ["item_id"], name: "index_feedbacks_on_item_id"
    t.index ["to_user_id"], name: "index_feedbacks_on_to_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.bigint "category_id", null: false
    t.string "name"
    t.text "description"
    t.text "images"
    t.float "starting_price"
    t.float "current_price"
    t.float "buy_it_now_price"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.text "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watchlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_watchlists_on_item_id"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "bids", "items"
  add_foreign_key "bids", "users", column: "bidder_id"
  add_foreign_key "feedbacks", "items"
  add_foreign_key "feedbacks", "users", column: "from_user_id"
  add_foreign_key "feedbacks", "users", column: "to_user_id"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "watchlists", "items"
  add_foreign_key "watchlists", "users"
end
