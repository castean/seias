Seias::Application.routes.draw do


  resources :worths

  resources :statuses

  resources :priorities

  match '/offices/end_office/:id' => 'offices#end_office'
  match '/offices/for_program_id/:program_id' => 'offices#for_program_id'
  resources :offices do
    get :autocomplete_person_last_name, :on => :collection
  end

  resources :type_people


  match '/families/add_family/:person_id' => 'families#add_family'
  match '/families/for_search' => 'families#for_search'
  #match '/families/add_family/action' => 'families#add_family/:person_id'
  resources :families   do
    get :autocomplete_last_name, :on => :collection
    get :autocomplete_name, :on => :collection
    get :autocomplete_second_last_name, :on => :collection

  end

  match '/benefits/new/:id' => 'benefits#new'
  resources :benefits

  post '/affiliates/new/' => "affiliates#new"
  match '/affiliates/new/:id' => "affiliates#new"
  match '/affiliates/for_program_id/:program_id' => 'affiliates#for_program_id'
  resources :affiliates do
    get :autocomplete_person_name, :on => :collection
    get :autocomplete_person_last_name, :on => :collection
    get :autocomplete_person_second_last_name, :on => :collection
    get :autocomplete_institution_name, :on => :collection
  end


  resources :documentations

  resources :functional_supports

  resources :age_ranges

  resources :guardianships

  resources :discapacities

  resources :discapacity_origins

  resources :school_types

  resources :grades

  resources :relationships

  resources :medical_services

  resources :religions

  resources :business_lines

  match '/institutions_types/for_institution_type_id/:id' => 'institutions_types#for_institution_type_id'
  resources :institutions_types

  resources :institutions do
    resources :age_populations
    resources :one_reg_institutions
    resources :school_ages
  end

  resources :sexes

  resources :ethnic_groups

  resources :marital_statuses

  resources :people

  resources :period_times

  match '/critical_factors/for_catalog_table_id/:table' => 'critical_factors#for_catalog_table_id'
  resources :critical_factors do
    resources :goals
  end

  resources :ped_programs
 
  resources :ped_program_definitions

  resources :ped_axis_developments

  resources :ped_themes

  resources :ped_sub_themes

  match '/priority_program_action_lines/for_catalog_table_id/:table' => 'priority_program_action_lines#for_catalog_table_id'
  get '/priority_program_action_lines/report' => "priority_program_action_lines#report", :as => :report
  resources :priority_program_action_lines

  resources :priority_program_strategies

  resources :priority_program_goals

  resources :priority_programs

  resources :ped_action_lines

  resources :ped_strategies

  resources :ped_goals

  match '/peds/for_catalog_table_id/:table' => 'peds#for_catalog_table_id'
  resources :peds

  match "/maps/index" => "maps#index"
  post '/maps/get_map' => "maps#get_map", :as => :reloadmapa
  resources :maps
  
  resources :place_types

  post '/places/import' => "places#place_import", :as => :importarlugares
  resources :places

  resources :directions
  
  #match '/statistical_maps/get_maps_by_town/:id' => 'statistical_maps#get_maps_by_town', :as => :mapa_por_localidad
  #resources :statistical_maps


  match '/departments/for_directionid/:id' => 'departments#for_directionid'
  match '/towns/for_countyid/:county_id' => 'towns#for_countyid'
  resources :departments

  match '/activities/for_activitytypeid/:activity_type_id' => 'activities#for_activitytypeid'
  match '/activities/for_programid/:program_id' => 'activities#for_programid'
  resources :activities

  resources :groups

  resources :countries
     
  #post '/towns/import' => "towns#town_import", :as => :importarlocalidades
  get '/towns/maps' => 'towns#maps'
  resources :towns

  resources :counties

  post '/states/import' => "states#states_import", :as => :importarestados
  resources :states

  match '/activity_types/for_catalog_table_id/:table' => 'activity_types#for_catalog_table_id'
  match '/activity_types/search' => 'activity_types#at_search'
  resources :activity_types do
    resource :unit_of_measurements
    get 'auto_complete_search'
  end
  
  #resources :activitygoals

  resources :public_targets

  match '/programs/report' => 'programs#program_search'
  match '/programs/program_report' => 'programs#program_report'
  match '/programs/program_report_all' => 'programs#program_report_all'
  match '/programs/program_report_county' => 'programs#program_report_county'
  match '/programs/for_catalog_table_id/:table' => 'programs#for_catalog_table_id'
  resources :programs

  match '/reports/report_town_act' => 'reports#report_town_act'
  match '/reports/program_report' => 'reports#program_report'
  match '/reports/program_report_all' => 'reports#program_report_all'
  match '/reports/program_report_county' => 'reports#program_report_county'
  resources :reports

  match '/critical_success_factors/for_catalog_table_id/:table' => 'critical_success_factors#for_catalog_table_id'
  match '/critical_success_factors/for_program_id/:id' => 'critical_success_factors#for_program_id'
  resources :critical_success_factors

  #resources :sexennial_state_plan_components

  resources :critical_success_factor_types
  match 'logout', :controller => 'user_sessions', :action => 'destroy'
  resource :user_sessions
  match '/users/change_password' => 'users#change_password'
  resources :users

  match "home/download_manual" => "home#download_manual", :as => :manual

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
