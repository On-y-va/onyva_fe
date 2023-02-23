Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :edit, :new]

  resources :trips, only: [:show, :new]

  post '/users/new', to: 'users#create'
  post '/trips/new', to: 'trips#create'
  get '/login', to: "users#login_form"
  post '/login', to: 'users#login_user'
end
