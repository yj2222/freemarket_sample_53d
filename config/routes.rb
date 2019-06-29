Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products do
    collection do
      get 'details'
      get 'upload'
    end
  end
  resources :mypages
  resources :users
  resources :credits
end
