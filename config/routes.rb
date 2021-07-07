Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :items
  resources :users, only: [:index]
  resources :groups, except: %i[show destroy] do
    resources :messages, only: %i[index create]
  end
  root 'groups#index'
end
