# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'index' => 'tasks#index'
  resources :tasks
  resources :sessions, only: %i[new create destroy]
  #一般ユーザのrouting
  resources :users
  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
