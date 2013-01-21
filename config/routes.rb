AuthServer::Application.routes.draw do
  get "sessions/new"

  get "users/new"

  match 'auth/login' => "auth#authenticate", :via => :post
  match 'home/index' => "home#index", :via => :get
  #match 'auth/new' => "auth#new", :via => :post
  #match 'measures/index' => "measures#index", :as => "measures_path"
  match 'measure/new' => "measures#create", :via => :post
  #match 'measure/new' => "newmeasure#newmeasure", :via => :post
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "success" => "users#success", :as => "success"
  
  resources :users
  resources :sessions
  root :to => 'users#new'
  
  resources :users do
    resources :measures
  end
  
end
