Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :trips do
    resources :flights, only: [:index, :new]
  end

  post '/trips/:trip_id/flights/new', to: 'flights#create'
  post '/trips/new', to: 'trips#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get "/logout" => "sessions#destroy", :as => :logout
end
