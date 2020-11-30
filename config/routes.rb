Rails.application.routes.draw do
  devise_for :users#, controllers: { registrations: 'users/registrations' }

  resources :colocations, except: [:index, :destroy] do
    get "roommates", to: 'colocations#roommates'
  end


  resources :assignations, except: [:destroy, :new]
  resources :tasks do
    collection do
      get "occasionnel", to: 'tasks#occasionnel'
    end
  end

  resources :preferences, except: [:create, :new, :destroy]

  resources :users, only: [:show, :index] do
    member do
      post :move
    end
  end

  require "sidekiq/web"
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end


  authenticated :user do
    root to: 'colocations#new', as: 'new'
  end

  unauthenticated do
    root to: "pages#home", as: "unauthenticated"
  end
end
