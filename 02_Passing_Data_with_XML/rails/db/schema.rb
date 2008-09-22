# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080922144539) do

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.float    "net_worth"
    t.integer  "number_of_ipods"
    t.date     "birthday"
    t.datetime "birthday_and_time"
    t.boolean  "rails_programmer"
    t.boolean  "flex_programmer"
  end

end
