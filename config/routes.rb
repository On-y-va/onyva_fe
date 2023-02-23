Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :edit]

  resources :trips, only: [:new]
end
