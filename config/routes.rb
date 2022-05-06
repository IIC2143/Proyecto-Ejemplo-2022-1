# frozen_string_literal: true

Rails.application.routes.draw do
  # Se añaden las rutas para el manejo de usuarios. Se crean rutas para crear/actualizar/eliminar un perfil de usuario
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', users: 'users' },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # users
  get 'users/profile/:id', to: 'users#profile', as: 'profile'
  get 'users/delete/:id', to: 'users#delete', as: 'delete_user'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'publications#index'

  # publications
  get '/publications', to: 'publications#index'
  get '/publications/new', to: 'publications#new'
  post '/publications', to: 'publications#create'
  get '/publication/:id', to: 'publications#show', as: 'publication'
  get '/publications/:id/edit', to: 'publications#edit', as: 'edit_publication'
  patch '/publication/:id', to: 'publications#update'
  delete '/publication/:id', to: 'publications#delete'

  # comments
  get '/comments/:publication_id/new', to: 'comments#new', as: 'new_comment'
  post '/comments', to: 'comments#create'
  delete '/comments/:id', to: 'comments#delete', as: 'comments_delete'
end
