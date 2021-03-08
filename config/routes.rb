Rails.application.routes.draw do
  devise_for :users
  root 'shares#index'
  resources :shares
end
