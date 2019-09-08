Rails.application.routes.draw do
    devise_for :users
    
    resources :users, only: [:show]
    resources :items, only: [:new, :create, :show]
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "tests#index"
  
  end
