AuthDemo::Application.routes.draw do
  resources :sessions
  resources :posts

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  root :to => "posts#index"
end
