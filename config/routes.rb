Rails.application.routes.draw do
  root 'homes#show'

  resources :homes, only: :show
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :menus, only: [:index, :show] 
  resources :favorites, only: [:index, :create, :destroy]
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  resources :users, only: [:show, :edit, :update]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
end
