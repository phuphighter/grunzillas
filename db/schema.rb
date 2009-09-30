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

ActiveRecord::Schema.define(:version => 20090630171140) do

  create_table "comments", :force => true do |t|
    t.string   "name",       :limit => 50
    t.string   "email",      :limit => 100
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "season",                            :null => false
    t.string   "season_description", :limit => 100, :null => false
    t.integer  "game_number",                       :null => false
    t.date     "date"
    t.integer  "score"
    t.integer  "opponent_score"
    t.integer  "win",                               :null => false
    t.integer  "loss",                              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.datetime "datetime",                 :null => false
    t.string   "field",      :limit => 10, :null => false
    t.string   "opponent",   :limit => 20, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "statistics", :force => true do |t|
    t.integer  "game_id",                                                           :null => false
    t.integer  "lineup_order"
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "game"
    t.integer  "plate_apps",                                       :default => 0
    t.integer  "at_bats",                                          :default => 0,   :null => false
    t.integer  "hits",                                             :default => 0,   :null => false
    t.integer  "singles",                                          :default => 0,   :null => false
    t.integer  "doubles",                                          :default => 0,   :null => false
    t.integer  "triples",                                          :default => 0,   :null => false
    t.integer  "home_runs",                                        :default => 0,   :null => false
    t.integer  "walks",                                            :default => 0,   :null => false
    t.integer  "fielders_choice",                                  :default => 0
    t.integer  "sac_fly",                                          :default => 0
    t.integer  "runs",                                             :default => 0,   :null => false
    t.integer  "rbi",                                              :default => 0,   :null => false
    t.decimal  "batting_average",    :precision => 6, :scale => 3, :default => 0.0, :null => false
    t.decimal  "on_base_percentage", :precision => 6, :scale => 3, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
