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

  resources :users, only: [:index, :show, :new] do
    collection do
      get 'identification', to: 'users#identification'
      get '/:id', to: 'users#show'
    end
    member do
      get 'profile/edit', to: 'profiles#edit'
    end
  end

  resources :items, only: [:index, :new, :create, :show, :edit, :update] do
    resources :images, only:[:index, :create]
    collection do
      get 'search', to: 'items#search'
    end
  end
    
  resources :card, only: [:new, :show] do
    collection do
      get "paying"
      post 'show',   to: 'card#show'
      post 'pay',    to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index, :show] do
    collection do
      get  'show',  to: 'purchase#show'
      get  '/:id/index', to: 'purchase#index',as:"item_buy"
      post '/:id/pay',   to: 'purchase#pay',as:"item_pay"
      get  '/:id/done',  to: 'purchase#done',as:"buy_done"
    end
  end

  get 'guide/beginner', to: 'guide#beginner'

end
