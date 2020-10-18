Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'items/purchase' => "items#purchase"


  #ユーザー管理、マイページ実装用（onlyで必要な機能だけ！

  get 'users/log-out' => 'users#logout'
  get 'users/creditcard' => 'users#creditcard'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items do
    member do
      get :purchase
    end
  end
  
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
