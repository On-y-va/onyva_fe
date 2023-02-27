Rails.application.routes.draw do
  root 'welcome#index'

  resource :user, except: [:show]
  get 'profile', to: 'users#show'
  get 'dashboard', to: 'users#show'

  resources :trips do
    resources :flights, only: [:index, :new]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get "/logout" => "sessions#destroy", :as => :logout
end
