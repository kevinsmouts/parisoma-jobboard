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

ActiveRecord::Schema.define(:version => 20121122025931) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "description"
    t.string   "logo"
    t.string   "industry"
    t.string   "headquarters"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "job_offers", :force => true do |t|
    t.string   "title"
    t.datetime "start_date"
    t.datetime "open_until"
    t.text     "job_description"
    t.text     "qualifications"
    t.string   "field_of_expertise"
    t.string   "location"
    t.string   "contact_email"
    t.integer  "company_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "job_offers", ["company_id"], :name => "index_job_offers_on_company_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "company_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "users", ["company_id"], :name => "index_users_on_company_id"

end
