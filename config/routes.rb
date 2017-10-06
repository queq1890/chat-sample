Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :groups, except: [:show, :destroy] do
    resources :messages, except: :show
  end
  root 'groups#index'
end
