Rails.application.routes.draw do
    devise_for :users
    
    resources :users, only: [:show]
    resources :items, only: [:new, :create, :show]
    resources :credit_cards, only: [:new, :show] do
      collection do
        post 'show',   to: 'credit_cards#show'
        post 'pay',    to: 'credit_cards#pay'
        post 'delete', to: 'credit_cards#delete'
      end
    end
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "tests#index"
  
  end
