# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#ping'
  get 'ping', to: 'application#ping', as: :ping
  get 'user/:id', to: 'users#get', as: :get_user
  post 'user/message', to: 'users#send_message', as: :send_user_message
end
