Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products do
    collection do
      get 'details'
      get 'purchase'
    end
  end
  
  resources :mypages
  resources :users
  resources :credits 
  resources :trades do
    collection do
      post 'buy'
      get 'done'
    end
  end

end
