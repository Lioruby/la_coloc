Rails.application.routes.draw do
  devise_for :users

  resources :colocations, except: [:index, :destroy] do
    resources :users, except: :destroy do
      resources :preferences, except: [:destroy]
      resources :assignations, only: :show
    end

    resources :assignations, only: [:index]

    resources :tasks, except: [:destroy]

  end

  resources :tasks, only: :destroy

  root to: 'pages#home'
end
