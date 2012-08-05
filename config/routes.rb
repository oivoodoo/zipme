Shortlinks::Application.routes.draw do
  root :to => 'home#index'

  match '/' => "home#index", :as => :home

  resources :sessions, :only => [:new, :create]
  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout

  resources :users, :only => [:new, :create]
  match '/sign_up' => 'users#new', :as => :sign_up

  resources :links, :only => [:create, :show, :update]

  offline = Rack::Offline.configure do
    cache "assets/application.js"
    cache "assets/application.css"

    files = Dir["#{root}/assets/**/*.{js,css,jpg,png,gif}", "#{root}/*.html"]
    files.each do |file|
      cache Pathname.new(file).relative_path_from(root)
    end

    network "/"
  end

  match "/application.manifest" => offline

  match '/:key' => "redirect#navigate", :as => :redirect
end

