Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :dashboard, only: [:index]
  root to: 'events#index'
end
