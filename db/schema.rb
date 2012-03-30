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

ActiveRecord::Schema.define(:version => 20120330171931) do

  create_table "addresses", :id => false, :force => true do |t|
    t.string "line_1",                      :null => false
    t.string "line_2"
    t.string "city",         :limit => 127, :null => false
    t.string "state",        :limit => 2,   :null => false
    t.string "zip_code",     :limit => 9,   :null => false
    t.string "phone_number", :limit => 10,  :null => false
  end

  create_table "auditoriums", :id => false, :force => true do |t|
    t.integer "id",                                  :null => false
    t.integer "theatre_id",                          :null => false
    t.string  "auditorium_identifier", :limit => 64, :null => false
    t.integer "seats_available",                     :null => false
  end

  add_index "auditoriums", ["theatre_id", "auditorium_identifier"], :name => "auditoriums_theatre_id_auditorium_identifier_key", :unique => true
  add_index "auditoriums", ["theatre_id"], :name => "auditoriums_theatres_id_idx"

  create_table "movie_showtimes", :id => false, :force => true do |t|
    t.integer  "id",            :null => false
    t.integer  "movie_id",      :null => false
    t.datetime "start_time",    :null => false
    t.integer  "auditorium_id", :null => false
  end

  add_index "movie_showtimes", ["movie_id"], :name => "movie_showtimes_movie_id_idx"
  add_index "movie_showtimes", ["start_time"], :name => "movie_showtimes_start_time_idx"

  create_table "movies", :id => false, :force => true do |t|
    t.integer "id",                            :null => false
    t.string  "name",           :limit => 256, :null => false
    t.integer "length_minutes",                :null => false
    t.integer "rating_id",                     :null => false
  end

  add_index "movies", ["name"], :name => "movies_name_key", :unique => true

  create_table "orders", :id => false, :force => true do |t|
    t.string  "line_1",                            :null => false
    t.string  "line_2"
    t.string  "city",               :limit => 127, :null => false
    t.string  "state",              :limit => 2,   :null => false
    t.string  "zip_code",           :limit => 9,   :null => false
    t.string  "phone_number",       :limit => 10,  :null => false
    t.integer "id",                                :null => false
    t.string  "confirmation_code"
    t.integer "movie_showtime_id",                 :null => false
    t.integer "payment_type_id",                   :null => false
    t.string  "credit_card_number", :limit => 16
    t.date    "expiration_date",                   :null => false
  end

  create_table "payment_types", :id => false, :force => true do |t|
    t.integer "id",                  :null => false
    t.string  "type", :limit => 128, :null => false
  end

  add_index "payment_types", ["type"], :name => "payment_types_type_key", :unique => true

  create_table "purchased_tickets", :id => false, :force => true do |t|
    t.integer "id",                   :null => false
    t.integer "order_id",             :null => false
    t.integer "purchase_price_cents", :null => false
  end

  create_table "ratings", :id => false, :force => true do |t|
    t.integer "id",                        :null => false
    t.string  "name",        :limit => 16, :null => false
    t.text    "description"
  end

  add_index "ratings", ["name"], :name => "ratings_name_key", :unique => true

  create_table "theatres", :id => false, :force => true do |t|
    t.string  "line_1",                      :null => false
    t.string  "line_2"
    t.string  "city",         :limit => 127, :null => false
    t.string  "state",        :limit => 2,   :null => false
    t.string  "zip_code",     :limit => 9,   :null => false
    t.string  "phone_number", :limit => 10,  :null => false
    t.integer "id",                          :null => false
    t.string  "name",                        :null => false
  end

  add_index "theatres", ["name"], :name => "theatres_name_key", :unique => true

  create_table "zip_codes", :id => false, :force => true do |t|
    t.string  "zip",                :limit => 16, :null => false
    t.string  "city",                             :null => false
    t.string  "state_abbreviation", :limit => 2,  :null => false
    t.string  "country",                          :null => false
    t.decimal "latitude",                         :null => false
    t.decimal "longitude",                        :null => false
  end

end
