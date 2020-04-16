# == Route Map
#
#                       Prefix Verb   URI Pattern                             Controller#Action
#                     v1_todos POST   /v1/todos(.:format)                     v1/todos#create
#                      v1_todo DELETE /v1/todos/:id(.:format)                 v1/todos#destroy
#                     v1_users GET    /v1/users(.:format)                     v1/users#index
#                              POST   /v1/users(.:format)                     v1/users#create
#                      v1_user GET    /v1/users/:id(.:format)                 v1/users#show
#          new_v1_user_session GET    /v1/users/auth/sign_in(.:format)        devise_token_auth/sessions#new
#              v1_user_session POST   /v1/users/auth/sign_in(.:format)        devise_token_auth/sessions#create
#      destroy_v1_user_session DELETE /v1/users/auth/sign_out(.:format)       devise_token_auth/sessions#destroy
#         new_v1_user_password GET    /v1/users/auth/password/new(.:format)   devise_token_auth/passwords#new
#        edit_v1_user_password GET    /v1/users/auth/password/edit(.:format)  devise_token_auth/passwords#edit
#             v1_user_password PATCH  /v1/users/auth/password(.:format)       devise_token_auth/passwords#update
#                              PUT    /v1/users/auth/password(.:format)       devise_token_auth/passwords#update
#                              POST   /v1/users/auth/password(.:format)       devise_token_auth/passwords#create
#  cancel_v1_user_registration GET    /v1/users/auth/cancel(.:format)         devise_token_auth/registrations#cancel
#     new_v1_user_registration GET    /v1/users/auth/sign_up(.:format)        devise_token_auth/registrations#new
#    edit_v1_user_registration GET    /v1/users/auth/edit(.:format)           devise_token_auth/registrations#edit
#         v1_user_registration PATCH  /v1/users/auth(.:format)                devise_token_auth/registrations#update
#                              PUT    /v1/users/auth(.:format)                devise_token_auth/registrations#update
#                              DELETE /v1/users/auth(.:format)                devise_token_auth/registrations#destroy
#                              POST   /v1/users/auth(.:format)                devise_token_auth/registrations#create
# v1_users_auth_validate_token GET    /v1/users/auth/validate_token(.:format) devise_token_auth/token_validations#validate_token

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'v1/users/auth'

  namespace :v1 do
    resources :todos, only: [:index, :create, :destroy]
    resources :users, only: [:index, :show, :create]
  end
end
