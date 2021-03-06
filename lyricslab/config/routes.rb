Lyricslab::Application.routes.draw do
  get "translations/new"
  get "translations/edit"
  #devise_for :users
  get "home/home"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
 devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 
  
  #devise_scope :user do
  #  get '/users/auth/facebook' => 'users/omniauth_callbacks#passthru'
  #  get '/users/auth/facebook/callback' => 'users/omniauth_callbacks#passthru'
  #end
 # devise_scope :user do
 # get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
 # get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#end
  
  
  # You can have the root of your site routed with "root"
   root 'home#home'
   resources :menus
   resources :translators do
     resources :translator_translations
   end
   resources :roles do
     resources :roles_menus
   end
   resources :languages do
     resources :translations
   end
  resources :translation_types 
  resources :pricings do
    collection do
      get "show_all"
    end
  end
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
