Rails.application.routes.draw do
  devise_for :members
  resources :customers
  root to: 'welcome#index'
  get '/clients', to: 'clients#index'
  get '/clients/new', to: 'clients#new'
  post '/clients/create', to: 'clients#create'
  get 'clients/:id/show', to: 'clients#show', as: 'clients_show'
  get 'clients/:id/edit', to: 'clients#edit', as: 'clients_edit'
  patch 'clients/:id/update', to: 'clients#update', as: 'clients_update'
end
