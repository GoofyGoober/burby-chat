Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root 'users#new'

  get 'ask_new_message', controller:'messages', action: 'ask_new_message'
end
