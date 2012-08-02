Shortlinks::Application.routes.draw do
  root :to => 'home#index'

  match '/' => "home#index", :as => :home

  resources :sessions, :only => [:new, :create]
  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout

  resources :users, :only => [:new, :create]
  match '/sign_up' => 'users#new', :as => :sign_up

  resources :links, :only => :create
end

