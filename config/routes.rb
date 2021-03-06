Rails.application.routes.draw do
  devise_for :users

  resources :runs, except: [:index] do
    resources :run_bookings, only: [ :new, :create, :destroy, :update ]
    resources :runner_reviews, only: [ :new, :create ]
    resources :run_owner_reviews, only: [ :new, :create ]

  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/search',  to: 'pages#search', as: "runs_search"
  get '/users/:id', to: 'users#show', as: "runner"

end
