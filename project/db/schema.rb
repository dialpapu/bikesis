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

ActiveRecord::Schema.define(version: 20141013173216) do

  create_table "accesory_parts", force: true do |t|
    t.integer  "productId"
    t.string   "productReference"
    t.string   "productName"
    t.string   "productTradeMark"
    t.string   "productImage"
    t.integer  "productPrice"
    t.boolean  "productStatus"
    t.string   "productDescription"
    t.string   "typeElement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.integer  "articleId"
    t.string   "articleTitle"
    t.integer  "managerId"
    t.date     "publicationDate"
    t.string   "body"
    t.string   "summary"
    t.boolean  "articleState"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bikes", force: true do |t|
    t.integer  "productId"
    t.string   "productReference"
    t.string   "productName"
    t.string   "productTradeMark"
    t.string   "productImage"
    t.integer  "productPrice"
    t.boolean  "productStatus"
    t.string   "productDescription"
    t.string   "measures"
    t.string   "bikeType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.integer  "personId"
    t.integer  "document"
    t.string   "personName"
    t.string   "lastName"
    t.string   "telephone"
    t.boolean  "personStatus"
    t.date     "birthDay"
    t.boolean  "publicity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contract_histories", force: true do |t|
    t.integer  "personId"
    t.date     "contractDate"
    t.date     "finalContractDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", force: true do |t|
    t.integer  "productId"
    t.string   "productReference"
    t.string   "productName"
    t.string   "productTradeMark"
    t.string   "productImage"
    t.integer  "productPrice"
    t.boolean  "productStatus"
    t.string   "productDescription"
    t.string   "size"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.integer  "productAmount"
    t.integer  "productId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "saleId"
    t.integer  "productId"
    t.integer  "itemAmount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", force: true do |t|
    t.integer  "personId"
    t.integer  "document"
    t.string   "personName"
    t.string   "lastName"
    t.string   "telephone"
    t.boolean  "personStatus"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree

  create_table "sales", force: true do |t|
    t.integer  "saleId"
    t.integer  "sellerId"
    t.integer  "clientId"
    t.date     "saleDate"
    t.boolean  "saleStatus"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sellers", force: true do |t|
    t.integer  "personId"
    t.integer  "document"
    t.string   "personName"
    t.string   "lastName"
    t.string   "telephone"
    t.boolean  "personStatus"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "sellers", ["email"], name: "index_sellers_on_email", unique: true, using: :btree
  add_index "sellers", ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true, using: :btree

end
