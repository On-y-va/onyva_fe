Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :trips, only: [:show, :edit, :update, :new, :destroy] do
    resources :flights, only: [:index, :new]
  end

  post '/users/new', to: 'users#create'
  post '/trips/new', to: 'trips#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  get "/logout" => "sessions#destroy", :as => :logout
end
