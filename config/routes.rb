Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :edit, :update, :new]

  resources :trips, only: [:show, :edit, :update,  :new]

  post '/users/new', to: 'users#create'
  post '/trips/new', to: 'trips#create'

  get '/auth/:provider/callback', to: 'sessions#create'
end
