Icampus::Application.routes.draw do

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :sessions
  resources :password_resets
  resources :users do
    resources :newsfeeds do
      collection { post :sort }
    end
    resources :photosfeeds do
      collection { post :sort }
    end
    resources :videosfeeds do
      collection { post :sort }
    end
    resources :eventsfeeds do
      collection { post :sort }
    end
    resource :directory
    resource :athletic
    resource :library_worldcat
    resources :centers
    resources :ios_main_icons
    resources :ios_feature_icons
    resources :ios_backgrounds
    resource :ios_topbar
    resources :android_main_icons
    resources :android_feature_icons
    resources :android_backgrounds
    resource :android_topbar
    resources :mobile_web_feature_icons
    resources :mobile_web_logos
    resource :mobile_web_topbar
    resource :apple_developer
    resource :android_profile
    resources :testers
    resource :project_info_page
    resource :support_email
    resource :cname
    resource :info_appstore
    member do
      get 'change_password'
      put 'change_password_update'
    end
    collection do
      get 'tab_feat'
      get 'tab_graph'
      get 'tab_dist'
      get 'tab_rel'
    end
  end

  resources :centers do
    resources :emergency_phones
    resources :emergency_contacts
    resources :places
    resources :library_locations do
      resources :library_hours
      resources :library_contacts
    end
  end

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :users do
      resources :centers
      member do
        get 'tab_feat'
        get 'tab_graph'
        get 'tab_dist'
        get 'tab_rel'
      end
    end
  end

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
  root :to => 'users#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
