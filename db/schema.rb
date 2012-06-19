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

ActiveRecord::Schema.define(:version => 20120619184302) do

  create_table "activities", :force => true do |t|
    t.string   "value"
    t.text     "description"
    t.integer  "town_id"
    t.integer  "group_id"
    t.integer  "public_target_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "activity_type_id"
    t.integer  "county_id"
    t.integer  "user_id"
    t.datetime "activity_date_start"
    t.datetime "activity_date_end"
    t.integer  "qty_men"
    t.integer  "qty_women"
  end

  add_index "activities", ["group_id"], :name => "index_activities_on_group_id"
  add_index "activities", ["public_target_id"], :name => "index_activities_on_public_target_id"
  add_index "activities", ["town_id"], :name => "index_activities_on_town_id"

  create_table "activity_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "measurement_description"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "measurement_id"
    t.integer  "critical_success_factor_id"
    t.integer  "priority"
    t.integer  "user_id"
  end

  create_table "activitygoals", :force => true do |t|
    t.string   "name"
    t.string   "presentation_advances"
    t.string   "kind_goal_capture"
    t.date     "goal_year"
    t.date     "create_year"
    t.string   "annualm"
    t.string   "annuals"
    t.string   "annuale"
    t.string   "annualstatus"
    t.string   "janm"
    t.string   "jans"
    t.string   "jane"
    t.string   "janstatus"
    t.string   "febm"
    t.string   "febs"
    t.string   "febe"
    t.string   "febstatus"
    t.string   "marm"
    t.string   "mars"
    t.string   "mare"
    t.string   "marstatus"
    t.string   "aprm"
    t.string   "aprs"
    t.string   "apre"
    t.string   "aprstatus"
    t.string   "maym"
    t.string   "mays"
    t.string   "maye"
    t.string   "maystatus"
    t.string   "junm"
    t.string   "juns"
    t.string   "june"
    t.string   "junstatus"
    t.string   "julm"
    t.string   "juls"
    t.string   "jule"
    t.string   "julstatus"
    t.string   "augm"
    t.string   "augs"
    t.string   "auge"
    t.string   "augstatus"
    t.string   "sepm"
    t.string   "seps"
    t.string   "sepe"
    t.string   "sepstatus"
    t.string   "octm"
    t.string   "octs"
    t.string   "octe"
    t.string   "octstatus"
    t.string   "novm"
    t.string   "novs"
    t.string   "nove"
    t.string   "novstatus"
    t.string   "decm"
    t.string   "decs"
    t.string   "dece"
    t.string   "decstatus"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "counties", :force => true do |t|
    t.integer  "cve_mun"
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "critical_success_factor_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "critical_success_factors", :force => true do |t|
    t.integer  "critical_success_factor_type_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description",                                                                      :null => false
    t.decimal  "percentage",                      :precision => 10, :scale => 5
    t.string   "objective_minimum"
    t.string   "objective_satisfying"
    t.string   "objective_excelent"
    t.integer  "unit_of_measurement_id",                                                           :null => false
    t.string   "unit_of_measurement_description",                                                  :null => false
    t.boolean  "confidential",                                                                     :null => false
    t.boolean  "active",                                                         :default => true, :null => false
    t.datetime "created_at",                                                                       :null => false
    t.datetime "updated_at",                                                                       :null => false
    t.integer  "program_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "direction_id"
  end

  create_table "directions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "goals", :force => true do |t|
    t.integer  "month",                      :null => false
    t.integer  "year",                       :null => false
    t.string   "minimum",                    :null => false
    t.string   "satisfying",                 :null => false
    t.string   "excelent",                   :null => false
    t.integer  "critical_success_factor_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "goals", ["critical_success_factor_id"], :name => "index_goals_on_critical_success_factor_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "vulnerable"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ped_action_lines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "hierarchy"
    t.integer  "ped_strategy_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "ped_goals", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "hierarchy"
    t.integer  "ped_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "ped_sub_theme_id"
  end

  create_table "ped_strategies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "hierarchy"
    t.integer  "ped_goal_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ped_sub_themes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "ped_id"
  end

  create_table "peds", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "place_types", :force => true do |t|
    t.string   "nick"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "places", :force => true do |t|
    t.integer  "place_type_id"
    t.string   "name"
    t.string   "address"
    t.integer  "town_id"
    t.text     "info"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "priority_program_action_lines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "hierarchy"
    t.integer  "priority_program_strategy_id"
    t.integer  "ped_action_line_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "priority_program_goals", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "hierarchy"
    t.integer  "priority_program_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "priority_program_strategies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "hierarchy"
    t.integer  "priority_program_goal_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "priority_programs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "department_id"
    t.integer  "responsable_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "direction_id"
    t.integer  "priority_program_action_line_id"
  end

  create_table "public_targets", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sexennial_state_plan_components", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "states", :force => true do |t|
    t.integer  "cve_ent"
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statistical_maps", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "towns", :force => true do |t|
    t.integer  "cve_loc"
    t.string   "name"
    t.integer  "county_id"
    t.string   "environment"
    t.string   "lat"
    t.string   "lon"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "altitude"
    t.string   "cve_carta"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "gmaps",       :default => "t"
  end

  create_table "units_of_measurement", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                     :null => false
    t.string   "email",                                    :null => false
    t.string   "login",                                    :null => false
    t.string   "last_name"
    t.string   "second_last_name"
    t.string   "crypted_password",                         :null => false
    t.string   "password_salt",                            :null => false
    t.string   "persistence_token",                        :null => false
    t.integer  "login_count",        :default => 0,        :null => false
    t.integer  "failed_login_count", :default => 0,        :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "active",             :default => false,    :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "roles",              :default => "--- []"
    t.integer  "department_id"
  end

end
