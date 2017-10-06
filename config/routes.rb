Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :groups, except: [:show, :destroy]
  resources :messages
  root 'groups#index'
end
