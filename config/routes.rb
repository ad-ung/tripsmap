Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "profile", to: 'pages#profile'
  get "write", to: 'pages#write'

  resources :trips, only: [:show] do
    resources :steps, only: [:new, :create]
  end
  resources :steps, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
