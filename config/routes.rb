Rails.application.routes.draw do
  devise_for :users

  root to: 'events#index'
  resources :events do
    get 'copy', action: :new
  end
  resources :tickets

  resources :participants, only: [:create, :destroy]
end
