Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # root to: 'home#index'
  devise_scope :user do
    get 'login',      to: 'users/sessions#new'
    post 'login',     to: 'users/sessions#create'
    get 'logout',     to: 'users/sessions#logout'
    delete 'logout',  to: 'users/sessions#destroy'
    get 'signup',     to: 'users/registrations#signup'
    get 'signup/registration',  to: 'users/registrations#new'
    # get 'signup/number',         to: 'users/registrations#number'
    # get 'signup/address',        to: 'users/registrations#address'
    # get 'signup/credit',         to: 'users/registrations#credit'
    # get 'signup/done',           to: 'users/registrations#done'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"

  get '/users/index', to: 'users#index'
  resources :users, only: [:index, :show, :new] do
    collection do

      get 'identification', to: 'users#identification'
    end
    resources :profiles, only: [:edit]
  end

  resources :items, only: [:index, :new, :create, :show] do
    resources :images, only:[:index, :create]
  end
    
  resources :card, only: [:new, :show] do
    collection do
      get "paying"
      post 'show',   to: 'card#show'
      post 'pay',    to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'show',  to: 'purchase#show'
      get 'index', to: 'purchase#index'
      post 'pay',  to: 'purchase#pay'
      get 'done',  to: 'purchase#done'
    end
  end
end
