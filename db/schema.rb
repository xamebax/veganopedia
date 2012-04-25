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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120425194445) do

  create_table "genders", :force => true do |t|
    t.string "name", :limit => 32, :default => "", :null => false
  end

  add_index "genders", ["id"], :name => "index_genders_on_id", :unique => true
  add_index "genders", ["name"], :name => "index_genders_on_name", :unique => true

  create_table "products", :force => true do |t|
    t.string   "name",               :limit => 128,                               :default => "", :null => false
    t.string   "company",            :limit => 128,                               :default => ""
    t.string   "shops",              :limit => 256,                               :default => ""
    t.text     "ingriedients",                                                    :default => ""
    t.integer  "user_id",                                                                         :null => false
    t.decimal  "price",                             :precision => 8, :scale => 2
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",                                                                      :null => false
    t.datetime "updated_at",                                                                      :null => false
  end

  add_index "products", ["company"], :name => "index_products_on_company"
  add_index "products", ["name"], :name => "index_products_on_name"
  add_index "products", ["user_id"], :name => "index_products_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username",               :limit => 16, :default => "", :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "location"
    t.integer  "gender_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["gender_id"], :name => "index_users_on_gender_id"
  add_index "users", ["id"], :name => "index_users_on_id", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username"

  add_foreign_key "products", "users", :name => "products_user_id_fk"

  add_foreign_key "users", "genders", :name => "users_gender_id_fk"

end
