Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'login',      to: 'users/sessions#new'
    post 'login',     to: 'users/sessions#create'
    get 'logout',     to: 'users/sessions#logout'
    delete 'logout',  to: 'users/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"

  resources :users, only: [:show] do
    collection do
      get 'identification', to: 'users#identification'
    end
  end

  resources :items, only: [:index, :new, :create, :show]

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
