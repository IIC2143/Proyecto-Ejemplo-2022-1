# frozen_string_literal: true

Rails.application.routes.draw do
  # Se añaden las rutas para el manejo de usuarios. Se crean rutas para crear/actualizar/eliminar un perfil de usuario
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'publications#index'

  get '/profiles', to: 'profiles#index'
  get '/profiles/new', to: 'profiles#new'
  post '/profiles', to: 'profiles#create'
  get '/profile/:id', to: 'profiles#show', as: 'profile'
  get '/profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/profile/:id', to: 'profiles#update'
  delete '/profile/:id', to: 'profiles#delete'

  get '/publications', to: 'publications#index'
  get '/publications/new', to: 'publications#new'
  post '/publications', to: 'publications#create'
  get '/publication/:id', to: 'publications#show', as: 'publication'
  get '/publications/:id/edit', to: 'publications#edit', as: 'edit_publication'
  patch '/publication/:id', to: 'publications#update'
  delete '/publication/:id', to: 'publications#delete'
end
