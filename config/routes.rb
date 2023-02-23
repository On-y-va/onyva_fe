Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :edit, :new]

  resources :trips, only: [:new]

  post '/users/new', to: 'users#create'
end
