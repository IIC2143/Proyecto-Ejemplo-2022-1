Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/user/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/user/:id', to: 'users#update'
  delete '/user/:id', to: 'users#delete'
  
  get '/publications', to: 'publications#index'
  get '/publications/new', to: 'publications#new'
  post '/publications', to: 'publications#create'
  get '/publication/:id', to: 'publications#show', as: 'publication'
  get '/publications/:id/edit', to: 'publications#edit', as: 'edit_publication'
  patch '/publication/:id', to: 'publications#update'
  delete '/publication/:id', to: 'publications#delete'
end
