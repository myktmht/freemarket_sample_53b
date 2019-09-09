Rails.application.routes.draw do

    devise_for :users
    
    resources :users, only: [:show]
    resources :items, only: [:new, :create, :show]
    resources :card, only: [:new, :show] do
      collection do
        get "paying"
        post 'show', to: 'card#show'
        post 'pay',  to: 'card#pay'
        post 'delete', to: 'card#delete'
      end
    end
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "tests#index"
  
  end
