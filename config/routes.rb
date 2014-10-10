Roadnottaken::Application.routes.draw do
  
  get "/legs/waypoint_up", to: "legs#waypoint_up"
  get "/legs/waypoint_down", to: "legs#waypoint_down"  
  
  resources :legs

  resources :trips

  resources :locations
  
  resources :waypoints

  root "pages#home"
  
  get "/home", to: "pages#home", as: "home"
  
  get "/signin", to: "sessions#new", as: "signin"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: "signout"
  
  namespace :admin do
    root "base#index"
    resources :users
  end
    
end
