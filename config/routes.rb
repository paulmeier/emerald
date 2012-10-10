Emerald::Application.routes.draw do
  
  resources :customer_information_control_systems

  resources :db2s

  resources :applications

  resources :customers

  resources :information_management_systems

  resources :sysplex_lpars

  resources :sysplexes

  resources :notifications

  resources :locations

  resources :machine_locs

  resources :cpus

  resources :machine_lpars

  resources :mods

  resources :machine_configs

  resources :capacities

  resources :lpar_configs

  devise_for :users

  resources :machines

  resources :lpars

  resources :ziips
  
  #Static pages
  get "static_pages/home", :as => "home"

  get "static_pages/reports", :as => "reports"
  
  get "static_pages/ziipreport", :as => "ziipreport"
  
  get "static_pages/cpureport", :as => "cpureport"

  get "static_pages/configuration", :as => "configuration"

  get "static_pages/documents", :as => "documents"

  get "static_pages/about", :as => "about"
  
  get "static_pages/storageLayout", :as => "storageLayout"
    
  get "static_pages/dconfig", :as => "dconfig"
  
  get "static_pages/rspec_output", :as => "rspec"
  
  get "static_pages/uploadcsv", :as => "uploadcsv"
  
  get "static_pages/emerald", :as => "emerald"

  #ZIIP Routes
  match 'ziips/:id/custom' => 'ziips#custom', :as => "ziips_custom"
  match 'ziips/zcustgraph' => 'ziips#zcustgraph', :as => "zcustgraph"
  match 'ziips/:id/canned' => 'ziips#canned', :as => "ziips_canned"
  match 'ziips/:id/twoweekavg' => 'ziips#twoweekavg', :as => "twoweekavg"
  match 'ziips/:id/twoweektot' => 'ziips#twoweektot', :as => "twoweektot"
  match 'ziips/:id/monAvg' => 'ziips#monAvg', :as => "monAvg"
  match 'ziips/:id/peaks' => 'ziips#peaksGraph', :as => "peaks"
  match 'ziips/:id/:lpar/all' => 'ziips#all', :as => "ziips_all"
  match 'ziips/:id/:name/allAvg' => 'ziips#allavg', :as => "ziips_allAvg"
  
  #CPU Routes
  match 'cpus/:id/:lpar/all' => 'cpus#all', :as => "cpus_all"  
  match 'cpus/:id/custom' => 'cpus#custom', :as => "cpus_custom"
  match 'cpus/:id/:name/allBox' => 'cpus#allBox', :as => "cpus_allBox"
  match 'cpus/:id/canned' => 'cpus#canned', :as => "cpus_canned"
  match 'cpus/mefbd' => 'cpus#mefbd', :as => "mefbd"
  match 'cpus/mefbdc' => 'cpus#mefbdc', :as => "mefbdc"
  match 'cpus/:id/avgday' => 'cpus#avgday', :as => "avgday"
  match 'cpus/custgraph' => 'cpus#custgraph', :as => "custgraph"
  
  #Routes to create custom json information, used in reporting
  #ZIIP
  match 'ziips/:id/total' => 'ziips#ztotal'
  match 'ziips/:id/total2' => 'ziips#ztotal2'
  match 'ziips/:id/hour' => 'ziips#zHour'
  match 'ziips/:id/:lpar/zall' => 'ziips#zAll'
  match 'ziips/:machine_id/zallavg' => 'ziips#zAllAvg'
  match 'ziips/:id/zday' => 'ziips#zday'
  
  #CPU
  match 'cpus/:id/total' => 'cpus#ctotal'
  match 'cpus/:id/:lpar/call' => 'cpus#cAll'
  match 'cpus/:id/:lpar/custom' => 'cpus#custom'
  match 'cpus/:machine_id/allCec' => 'cpus#allCec'
  match 'cpus/:machine_id/totBox' => 'cpus#totBox'

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
  root :to => 'static_pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
