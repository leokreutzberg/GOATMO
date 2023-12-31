Rails.application.routes.draw do
  # get 'reviews/new'
  devise_for :users

  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  get '/dashboard', to: 'users#dashboard'
  resources :goats do
    resources :bookings, only: [:new, :create]
  end

  resources :goats, only: [:destroy]

  resources :bookings, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end
   resources :reviews, only: [:destroy]
  end
  # Defines the root path route ("/")
  # root "posts#index"
