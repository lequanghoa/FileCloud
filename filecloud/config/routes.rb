Filecloud::Application.routes.draw do

  resources :uploads do 
    member do
      get 'download'
    end
  end
  #  resources :users
  resources :roles

  resources :folders

  resources :categories

  authenticated :user do
    root :to => 'home#index'
  end

  devise_scope :user do
    root :to => "devise/registrations#new"
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
    match '/users/sign_out' => 'devise/sessions#destroy', :via => :delete, :as => :destroy
    match '/users/:id' => 'users#destroy', :via => :delete, :as => :destroy
    match '/users/password' => 'confirmations#create'
#    match '/users/password/new' => 'devise/confirmations#reset_password'
   
  end

  
  devise_for :users, :controllers => { :confirmations => "confirmations" }
  #:registrations => "registrations", 
  resources :users, :only => [:destroy,:show, :index] do
    get 'invite', :on => :member
  end

end

  



#match "/home", to: "static_pages#home"
#match "signup", to: "users#new"
#
#
#root to:"static_pages#home"
#
#match "/",  to: "static_pages#home"

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
# root :to => 'welcome#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'

