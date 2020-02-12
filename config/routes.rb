Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'messages/create'
  root 'home#index'

  devise_for :users

  resources :conversations, only: [:create] do
    resources :messages, only: [:create]
    member do
      post :close
    end
  end
end