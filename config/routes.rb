Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :groups, only: [:index, :new, :edit]
  resources :messages
  root 'messages#index'
end
