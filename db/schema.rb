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

ActiveRecord::Schema.define(version: 2021_12_06_211033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.integer "price"
    t.bigint "stand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stand_id"], name: "index_products_on_stand_id"
  end

  create_table "purchased_products", force: :cascade do |t|
    t.bigint "purchase_id"
    t.bigint "product_id"
    t.integer "amount", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_purchased_products_on_product_id"
    t.index ["purchase_id"], name: "index_purchased_products_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "operator_id", null: false
    t.bigint "stand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["operator_id"], name: "index_purchases_on_operator_id"
    t.index ["stand_id"], name: "index_purchases_on_stand_id"
  end

  create_table "spiridon_purchases", force: :cascade do |t|
    t.integer "amount", default: 0, null: false
    t.bigint "operator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["operator_id"], name: "index_spiridon_purchases_on_operator_id"
  end

  create_table "stands", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon"
    t.bigint "operator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["operator_id"], name: "index_stands_on_operator_id"
  end

  create_table "stands_users", id: false, force: :cascade do |t|
    t.bigint "stand_id"
    t.bigint "user_id"
    t.index ["stand_id"], name: "index_stands_users_on_stand_id"
    t.index ["user_id"], name: "index_stands_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "image"
    t.string "language", default: "ro"
    t.integer "department"
    t.integer "position", default: 0, null: false
    t.integer "grade", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.hstore "preferences", default: {}
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["preferences"], name: "index_users_on_preferences", using: :gist
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "stands"
  add_foreign_key "purchases", "stands"
  add_foreign_key "purchases", "users", column: "operator_id"
  add_foreign_key "spiridon_purchases", "users", column: "operator_id"
  add_foreign_key "stands", "users", column: "operator_id"
end
