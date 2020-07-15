Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "profile", to: 'pages#profile'
  get "write", to: 'pages#write'
  get "explore", to: 'steps#explore'
  patch "steps/:id", to: "steps#update"

  resources :trips, only: [:show, :new, :create] do
    resources :steps, only: [:new, :create]
  end
  resources :steps, only: [:show] do
    resources :favorites, only: [:create]
  end

  resources :favorites, only: [:index, :destroy]
end
