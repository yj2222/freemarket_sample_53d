Rails.application.routes.draw do
  root 'products#index'
  resources :products do
    collection do
      get 'details'
    end
  end
  resources :mypages
  resources :users
  resources :credits
end
