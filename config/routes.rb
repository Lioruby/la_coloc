Rails.application.routes.draw do
  devise_for :users

  resources :colocations, except: [:index, :destroy]
  resources :assignations, only: [:index, :show, :update]
  resources :tasks
  resources :preferences, except: [:create, :new, :destroy]
  resources :users, only: :show

  get "roommates", to: 'colocations#roommates'

  root to: 'pages#home'
end
