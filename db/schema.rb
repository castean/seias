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

ActiveRecord::Schema.define(:version => 20121031192516) do

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
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "priority"
    t.integer  "user_id"
    t.integer  "unit_of_measurement_id"
  end

  create_table "activity_types_critical_success_factors", :id => false, :force => true do |t|
    t.integer "activity_type_id"
    t.integer "critical_success_factor_id"
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

  create_table "affiliates", :force => true do |t|
    t.integer  "person_id"
    t.integer  "institution_id"
    t.integer  "activity_type_id"
    t.integer  "period_time_id"
    t.integer  "period_number"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "institution_ben_id"
  end

  create_table "age_populations", :force => true do |t|
    t.integer  "institution_id"
    t.integer  "guardianship_id"
    t.integer  "sex_id"
    t.integer  "age_range_id"
    t.integer  "total_qty_registered"
    t.integer  "real_qty_registered"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "age_ranges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "benefits", :force => true do |t|
    t.string   "period"
    t.integer  "worth"
    t.integer  "benefit_category_id"
    t.date     "delivery_date"
    t.integer  "qty"
    t.decimal  "unit_price"
    t.integer  "affiliate_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "business_lines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "institution_type_id"
  end

  create_table "catalog_tables", :force => true do |t|
    t.string   "name",       :default => "t", :null => false
    t.string   "model",      :default => "t", :null => false
    t.string   "table",      :default => "t", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "catalog_tables_critical_factors", :id => false, :force => true do |t|
    t.integer "catalog_table_id"
    t.integer "critical_factor_id"
    t.integer "table_select_field_id"
  end

  create_table "counties", :force => true do |t|
    t.integer  "cve_mun"
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "counties_judical_districts", :id => false, :force => true do |t|
    t.integer "county_id"
    t.integer "judical_district_id"
  end

  create_table "counties_judicial_districts", :id => false, :force => true do |t|
    t.integer "county_id"
    t.integer "judicial_district_id"
  end

  create_table "counties_regions", :id => false, :force => true do |t|
    t.integer "county_id"
    t.integer "region_id"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "criterion_of_measurements", :force => true do |t|
    t.string   "name",       :default => "t", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "critical_factors", :force => true do |t|
    t.integer  "critical_success_factor_type_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description",                                                                      :null => false
    t.decimal  "percentage",                      :precision => 10, :scale => 5
    t.float    "objective_minimum"
    t.float    "objective_satisfying"
    t.float    "objective_excelent"
    t.integer  "unit_of_measurement_id",                                                           :null => false
    t.boolean  "confidential",                                                                     :null => false
    t.boolean  "active",                                                         :default => true, :null => false
    t.datetime "created_at",                                                                       :null => false
    t.datetime "updated_at",                                                                       :null => false
    t.integer  "criterion_of_measurement_id"
    t.integer  "catalog_table_id"
    t.integer  "critical_factor_id"
    t.integer  "period_time_id"
    t.integer  "responsable_id"
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

  create_table "critical_success_factors_priority_program_action_lines", :id => false, :force => true do |t|
    t.integer "priority_program_action_line_id"
    t.integer "critical_success_factor_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "direction_id"
    t.integer  "user_id"
  end

  create_table "directions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "discapacities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "discapacities_one_reg_institutions", :id => false, :force => true do |t|
    t.integer "one_reg_institution_id"
    t.integer "discapacity_id"
  end

  create_table "discapacities_people", :id => false, :force => true do |t|
    t.integer "discapacity_id"
    t.integer "person_id"
  end

  create_table "discapacity_origins", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documentations", :force => true do |t|
    t.string   "name"
    t.integer  "belongs"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documentations_people", :id => false, :force => true do |t|
    t.integer "documentation_id"
    t.integer "person_id"
  end

  create_table "ethnic_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "families", :force => true do |t|
    t.integer  "person_id"
    t.integer  "kin_id"
    t.integer  "relationship_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.decimal  "income"
  end

  create_table "father_institutions", :id => false, :force => true do |t|
    t.integer "institution_id"
    t.integer "father_institution_id"
  end

  create_table "functional_supports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "functional_supports_people", :id => false, :force => true do |t|
    t.integer "functional_support_id"
    t.integer "person_id"
  end

  create_table "goals", :force => true do |t|
    t.integer  "month",              :null => false
    t.integer  "year",               :null => false
    t.string   "minimum",            :null => false
    t.string   "satisfying",         :null => false
    t.string   "excelent",           :null => false
    t.integer  "critical_factor_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "goals", ["critical_factor_id"], :name => "index_goals_on_critical_success_factor_id"

  create_table "grades", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "vulnerable"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "guardianships", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "institutions", :force => true do |t|
    t.integer  "institution_type_id"
    t.string   "name"
    t.integer  "type_person"
    t.string   "legal_name"
    t.string   "legal_last_name"
    t.string   "legal_second_last_name"
    t.string   "rfc"
    t.integer  "link_user_id"
    t.integer  "town_id"
    t.string   "address"
    t.integer  "external_address_number"
    t.integer  "internal_address_number"
    t.string   "second_address"
    t.integer  "zip_code"
    t.datetime "date_operation_start"
    t.datetime "date_operation_end"
    t.integer  "religion_id"
    t.string   "email"
    t.integer  "business_line_id"
    t.integer  "status_id"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "county_id"
    t.string   "phone"
  end

  create_table "institutions_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "judicial_districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "circunscription"
  end

  create_table "marital_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medical_services", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "one_reg_institutions", :force => true do |t|
    t.integer  "institution_id"
    t.boolean  "according_social_purpose"
    t.integer  "people_sex"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "capacity"
    t.integer  "public_target_id"
    t.integer  "operation_status"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "ped_action_lines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "hierarchy"
    t.integer  "ped_strategy_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "ped_axis_developments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "ped_id"
  end

  create_table "ped_axis_developments_ped_program_definitions", :id => false, :force => true do |t|
    t.integer "ped_axis_development_id"
    t.integer "ped_program_definition_id"
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

  create_table "ped_program_definitions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "ped_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ped_programs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "ped_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "ped_theme_id"
    t.integer  "hierarchy"
  end

  create_table "ped_themes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "ped_axis_development_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "peds", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "ped_program"
  end

  create_table "people", :force => true do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name",                    :null => false
    t.string   "last_name",               :null => false
    t.string   "second_last_name"
    t.integer  "marital_status_id"
    t.integer  "ethnic_group_id",         :null => false
    t.datetime "birthday",                :null => false
    t.integer  "born_town_id"
    t.integer  "town_id"
    t.string   "address"
    t.string   "address_two"
    t.integer  "code_area"
    t.integer  "phone"
    t.integer  "cel_phone"
    t.integer  "emergency_phone"
    t.string   "rfc"
    t.string   "curp"
    t.string   "email"
    t.string   "tutor"
    t.integer  "tutor_relationship_id"
    t.integer  "tutor_marital_status_id"
    t.integer  "medical_service_id"
    t.boolean  "student"
    t.boolean  "reader"
    t.integer  "schooling"
    t.integer  "school_type_id"
    t.boolean  "worker"
    t.string   "job"
    t.boolean  "self_employment"
    t.string   "occupation"
    t.boolean  "job_seeker"
    t.integer  "user_id"
    t.boolean  "discapacity_status"
    t.boolean  "diagnosis"
    t.text     "diagnosis_description"
    t.integer  "discapacity_origin_id"
    t.date     "discapacity_origin_year"
    t.text     "observations"
    t.integer  "status_id"
    t.boolean  "use_functional_support"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "county_id"
    t.integer  "sex"
    t.integer  "born_county_id"
    t.float    "income"
  end

  create_table "period_times", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "priority_program_action_lines_programs", :id => false, :force => true do |t|
    t.integer "priority_program_action_line_id"
    t.integer "program_id"
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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "direction_id"
    t.integer  "cut_day"
    t.datetime "program_start_date"
  end

  create_table "programs_users", :id => false, :force => true do |t|
    t.integer "program_id"
    t.integer "user_id"
  end

  create_table "public_targets", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relations", :force => true do |t|
    t.integer  "person_id"
    t.integer  "relative_id"
    t.integer  "relationship_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "relationships", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relatives", :force => true do |t|
    t.integer  "person_id"
    t.integer  "relative_id"
    t.integer  "relationship_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "religions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "school_ages", :force => true do |t|
    t.integer  "institution_id"
    t.integer  "grade_id"
    t.integer  "guardianship_id"
    t.integer  "sex_id"
    t.integer  "total_qty_registered"
    t.integer  "real_qty_registered"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "school_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sexennial_state_plan_components", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sexes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.string   "name"
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

  create_table "type_people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.string   "name",                                      :null => false
    t.string   "email",                                     :null => false
    t.string   "login",                                     :null => false
    t.string   "last_name"
    t.string   "second_last_name"
    t.string   "crypted_password",                          :null => false
    t.string   "password_salt",                             :null => false
    t.string   "persistence_token",                         :null => false
    t.integer  "login_count",         :default => 0,        :null => false
    t.integer  "failed_login_count",  :default => 0,        :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "active",              :default => false,    :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "roles",               :default => "--- []"
    t.integer  "department_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
