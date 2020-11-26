Rails.application.routes.draw do
  devise_for :users

  resources :colocations, except: [:index, :destroy] do
    get "roommates", to: 'colocations#roommates'
  end


  resources :tasks
  resources :assignations, only: [:index, :show, :edit, :update]
  resources :preferences, except: [:create, :new, :destroy]
  resources :users, only: :show do
    member do
      post :move
    end
  end


  root to: 'pages#home'
end
