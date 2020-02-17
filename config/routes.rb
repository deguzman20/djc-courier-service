Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  get "messages/create"
  root "home#chat"

  devise_for :users

  # User routes
  get "map", to: "home#map", as: :user_map
  get "chat", to: "home#chat", as: :user_chat
  get "update_geolocation", to: "home#update_geolocation"
  get "my_coordinate", to: "home#my_coordinate"
  get "map_coordinates", to: "home#map_coordinates"

  # Profile routes
  get "profile/:id", to: "profiles#profile", as: :user_profile
  get "update_profile_info", to: "profiles#update_profile_info"

  resources :conversations, only: [:create] do
    resources :messages, only: [:create]
    member do
      post :close
    end
  end
end
