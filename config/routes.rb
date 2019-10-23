Rails.application.routes.draw do
    devise_for :users
    
    resources :users, only: [:show] do
      resources :profiles, only: [:edit]
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
    resources :items, only: [:new, :create, :show]
    #resources :mypage_card, only: [:index, :new]
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "items#index"
  
  end
