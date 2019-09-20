Rails.application.routes.draw do
    devise_for :users
    
    resources :users, only: [:show]
    resources :items, only: [:index, :new, :create, :show]
    resources :card, only:[:new]
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "items#index"
  
  end
