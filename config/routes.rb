AuthDemo::Application.routes.draw do
  resources :sessions
  resources :posts

  get "login" => "sessions#new", :as => "login"
end
