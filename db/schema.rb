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

ActiveRecord::Schema.define(:version => 20120220123318) do

  create_table "movie_showtimes", :id => false, :force => true do |t|
    t.integer  "id",                       :null => false
    t.integer  "movie_id"
    t.integer  "theatre_id"
    t.string   "auditorium", :limit => 16
    t.datetime "start_time"
  end

  create_table "movies", :id => false, :force => true do |t|
    t.integer "id",                            :null => false
    t.string  "name",           :limit => 256, :null => false
    t.integer "length_minutes",                :null => false
    t.string  "rating",         :limit => 8,   :null => false
  end

  add_index "movies", ["name"], :name => "movies_name_key", :unique => true

  create_table "theatres", :id => false, :force => true do |t|
    t.integer "id",                              :null => false
    t.string  "name",             :limit => 256
    t.string  "address_line_1",   :limit => 256
    t.string  "address_line_2",   :limit => 256
    t.string  "address_city",     :limit => 128
    t.string  "address_state",    :limit => 2
    t.string  "address_zip_code", :limit => 9
    t.string  "phone_number",     :limit => 10
  end

end
