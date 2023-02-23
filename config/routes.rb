Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :edit, :new]

  resources :trips, only: [:new]

  get '/login', to: "users#login_form"
  post '/login', to: 'users#login_user'
end
