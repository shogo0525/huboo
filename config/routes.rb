Rails.application.routes.draw do
  devise_for :users

  root to: 'events#index'
  resources :events do
    get 'copy', action: :new
    post 'cancel', on: :member, action: :cancel
  end
  resources :tickets

  resources :participants do
    post 'kick_out', on: :member
  end
end
