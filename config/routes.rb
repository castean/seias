Seias::Application.routes.draw do
 
  resources :priority_program_action_lines

  resources :priority_program_strategies

  resources :priority_program_goals

  resources :priority_programs

  resources :ped_action_lines

  resources :ped_strategies

  resources :ped_goals

  resources :peds

  match "/maps/index" => "maps#index"
  post '/maps/get_map' => "maps#get_map", :as => :reloadmapa
  resources :maps
  
  resources :place_types

  post '/places/import' => "places#place_import", :as => :importarlugares
  resources :places

  resources :directions
  
  match '/statistical_maps/get_maps_by_town/:id' => 'statistical_maps#get_maps_by_town', :as => :mapa_por_localidad
  resources :statistical_maps


  match '/departments/for_directionid/:id' => 'departments#for_directionid'
  match '/departments/for_countyid/:id' => 'departments#for_countyid'
  resources :departments

  resources :activities

  resources :groups

  resources :countries
     
  post '/towns/import' => "towns#town_import", :as => :importarlocalidades
  get '/towns/maps' => 'towns#maps'
  resources :towns

  resources :counties

  post '/states/import' => "states#states_import", :as => :importarestados
  resources :states

  resources :activity_types

  resources :activitygoals

  resources :public_targets

  resources :programs

  resources :critical_success_factors do
    resources :goals
  end

  resources :sexennial_state_plan_components

  resources :critical_success_factor_types
  match 'logout', :controller => 'user_sessions', :action => 'destroy'
  resource :user_sessions

  resources :users
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
