Rails.application.routes.draw do
    devise_for :users
    
    resources :users, only: [:show]
    resources :card, only: [:new]
    resources :items, only: [:new, :create, :show]
    resources :mypage_card, only: [:index, :new]
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "tests#index"
  
  end
