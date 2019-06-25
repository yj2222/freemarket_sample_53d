Rails.application.routes.draw do
  root 'products#index'
  resources :products
  resources :mypages
  get   'users'  => 'users#new_registration'
end
