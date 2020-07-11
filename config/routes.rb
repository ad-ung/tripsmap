Rails.application.routes.draw do
  get 'favorite/index'
  get 'favorite/create'
  get 'favorite/destroy'
  devise_for :users
  root to: 'pages#home'
  get "profile", to: 'pages#profile'
  get "write", to: 'pages#write'
  get "explore", to: 'steps#explore'
  get "favoris", to: 'favorite#index'
  patch "steps/:id", to: "steps#update"

  resources :trips, only: [:show] do
    resources :steps, only: [:new, :create]
  end
  resources :steps, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :steps, only:[:show]
end
