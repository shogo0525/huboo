Rails.application.routes.draw do
  devise_for :users

  root to: 'events#index'
  resources :events
  resources :tickets

  resources :participants, only: [:create, :destroy]
end
