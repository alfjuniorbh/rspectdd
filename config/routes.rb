Rails.application.routes.draw do
  devise_for :members
  resources :customers
  root to: 'welcome#index'
  get '/clients', to: 'clients#index'
  get '/clients/new', to: 'clients#new'
  post '/clients/create', to: 'clients#create'
  get 'clients/show', to: 'clients#show'
end
