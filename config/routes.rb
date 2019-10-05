Rails.application.routes.draw do
    devise_for :users
    
    resources :users, only: [:show]
    resources :items, only: [:index, :new, :create, :show] do
      resources :images, only:[:index, :create]
    end
    resources :card, only: [:new]
    resources :mypage_card, only: [:index, :new]
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "tests#index"
  
  end
