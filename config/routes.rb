Rails.application.routes.draw do
  devise_for :users

  resources :colocations, except: [:index, :destroy] do
    get "roommates", to: 'colocations#roommates'
  end


  resources :assignations, except: [:destroy, :new] do
    member do
      post :update_before_photo
    end
  end
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


  root to: 'pages#home'
end
