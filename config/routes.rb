Rails.application.routes.draw do
  devise_for :users
  root 'share#index'
  resources :shares 
end
