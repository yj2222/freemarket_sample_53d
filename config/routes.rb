Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    get 'login', to: 'users/sessions#login'
    get 'signup', to: 'users/sessions#signup'
    get 'signup/information', to: 'users/registrations#information'
    get 'signup/tel_authentication', to: 'users/registrations#tel_authentication'
    get 'signup/address', to: 'users/registrations#address'
    get 'signup/payment', to: 'users/registrations#payment'
    get 'signup/complete', to: 'users/registrations#complete'
    post 'users', to: 'users/registrations#create'
    get 'signup/all', to: 'users/registrations#all'
    post 'signup/all', to: 'users/registrations#create'
  end

  root 'products#index'
  resources :products do
    collection do
      get 'details'
      get 'upload'
    end
  end
  resources :mypages
  resources :credits
end
