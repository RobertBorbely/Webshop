Rails.application.routes.draw do

  #devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users
  devise_for :users, :path => "/user", :path_names => { :sign_up => 'signup', :sign_in => 'login', :sign_out => 'logout' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :categories
  resources :products do
    member do
      post :add_to_cart
    end
    resources :reviews, except: [:show, :index]
  end
  resources :pages
  resources :menu_items, :menus

  resources :shopping_carts do
    collection do
      get :my_cart
      delete :remove
    end
  end  

  resources :orders

  post "/orders/:id" => "orders#show"
  post "/hook" => "orders#hook"

end
