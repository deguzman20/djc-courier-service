Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'messages/create'
  root 'home#index'

  devise_for :users

  get "map", to: "home#map"
  get "chat", to: "home#index"
  get "map_coordinates", to: "home#map_coordinates"

  resources :conversations, only: [:create] do
    resources :messages, only: [:create]
    member do
      post :close
    end
  end
end