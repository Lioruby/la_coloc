Rails.application.routes.draw do
  devise_for :users

  resources :colocations, except: [:index, :destroy] do

    get "roommates", to: 'colocations#roommates'

    get 'new_invitation', to: 'colocations#new_invitation'

    post 'create_invitation', to: 'colocations#create_invitation'

    get 'new_roomates', to: 'colocations#new_roomates'

    post 'create_roomates', to: 'colocations#create_roomates'
  end

  resources :assignations, except: [:destroy, :new] do

    member do
      post :update_before_photo
    end
  end
  resources :tasks, except: [:destroy] do

    collection do
      get "occasionnel", to: 'tasks#occasionnel'
    end
  end

  resources :depenses, except: [:destroy] do

    collection do
      get 'recap', to: 'depenses#recap'
    end
  end

  resources :preferences, except: [:create, :new, :destroy]

  resources :users, only: [:show, :index] do

    member do
      post :move
    end

    get 'destroy_current_colocation_task_index', to: 'users#destroy_current_colocation_task_index'

    delete 'destroy_current_colocation_task', to: 'users#destroy_current_colocation_task'
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
