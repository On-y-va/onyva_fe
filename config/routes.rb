Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, except: [:index, :new, :create]
  resources :trips do
    
    resources :flights, only: [:index, :new]
  end
  post '/trips/:trip_id/flights/new', to: 'flights#create'
  get "/api/v1/users/:user_id/trips/:trip_id", to: 'trip_attendees#update'
  get "/api/v1/users/:user_id/trips/:trip_id/delete", to: 'trip_attendees#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  get "/logout" => "sessions#destroy", :as => :logout
end
