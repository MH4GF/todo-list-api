# == Route Map
#
#   Prefix Verb   URI Pattern             Controller#Action
# v1_todos POST   /v1/todos(.:format)     v1/todos#create
#  v1_todo DELETE /v1/todos/:id(.:format) v1/todos#destroy
# v1_users GET    /v1/users(.:format)     v1/users#index
#          POST   /v1/users(.:format)     v1/users#create
#  v1_user GET    /v1/users/:id(.:format) v1/users#show

Rails.application.routes.draw do
  namespace :v1 do
    resources :todos, only: [:create, :destroy]
    resources :users, only: [:index, :show, :create]
  end
end
