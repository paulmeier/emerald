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

ActiveRecord::Schema.define(:version => 20120911204327) do

  create_table "capacities", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "capSetting"
    t.integer  "msu"
    t.integer  "mips"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cpus", :force => true do |t|
    t.datetime "datetime"
    t.string   "smfid"
    t.integer  "mips"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lpar_configs", :force => true do |t|
    t.integer  "lpar_id"
    t.integer  "codedWeight"
    t.integer  "runningWeight"
    t.integer  "ziipWeight"
    t.integer  "zaapWeight"
    t.integer  "capValue"
    t.integer  "localEngines"
    t.integer  "ziip"
    t.integer  "zaap"
    t.integer  "ifl"
    t.integer  "storageCbu"
    t.integer  "storageNormal"
    t.integer  "reservedStorage"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "lpars", :force => true do |t|
    t.string   "mid"
    t.string   "smfid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "machine_configs", :force => true do |t|
    t.integer  "machine_id"
    t.string   "name"
    t.string   "mod_id"
    t.integer  "capacity_id"
    t.integer  "machineLoc_id"
    t.integer  "centralStorage"
    t.integer  "ziip"
    t.integer  "icf"
    t.integer  "cbu"
    t.integer  "ifb"
    t.integer  "es"
    t.integer  "fi"
    t.integer  "osa"
    t.integer  "crypto"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "machine_locs", :force => true do |t|
    t.integer  "location_id"
    t.integer  "machine_id"
    t.integer  "raisedFloorLoc"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "machine_lpars", :force => true do |t|
    t.integer  "lpar_id"
    t.integer  "machine_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "machines", :force => true do |t|
    t.string   "name"
    t.string   "serialNumber"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "mods", :force => true do |t|
    t.string   "name"
    t.integer  "books"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notifications", :force => true do |t|
    t.string   "name"
    t.text     "msg"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "ziips", :force => true do |t|
    t.datetime "DateTime"
    t.string   "LPAR"
    t.float    "PCTBOX"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
