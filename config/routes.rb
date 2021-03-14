Rails.application.routes.draw do
  devise_for :users
  root 'shares#index'
  resources :shares
  resources :chat_rooms, only: [:create, :show]
end
