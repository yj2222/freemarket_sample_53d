Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'users/sessions#signup'
    get 'signup/all', to: 'users/registrations#all'
    post 'signup/all', to: 'users/registrations#create'
    get 'signup/payment', to: 'users/registrations#payment'
    post 'signup/payment', to: 'users/registrations#create_payment'
    get 'signup/complete', to: 'users/registrations#complete'
    delete 'mypages/logout', to: 'users/sessions#destroy'
  end

  root 'products#index'
  resources :products do
    get 'purchase', on: :member
    get 'exhibit'
  end

  resources :mypages do
    collection do
      get 'logout'
      get 'profile'
      get 'identification'
      get 'selled'
    end
  end
  resources :credits
  resources :trades do
    post 'buy', on: :member
    get 'done'
  end
end
