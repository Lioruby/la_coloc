Rails.application.routes.draw do
  devise_for :users

  resources :colocations, except: [:index, :destroy]
  resources :assignations, only: [:index, :show]
  resources :tasks
  resources :preferences, except: [:create, :new, :destroy]

  root to: 'pages#home'
end
