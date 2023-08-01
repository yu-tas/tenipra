Rails.application.routes.draw do
  devise_for :users
  resources :menus, only: [:index, :show]
end
