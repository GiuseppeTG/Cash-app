Rails.application.routes.draw do
  root 'splash#index'
  devise_for :users, path: ''
  resources :users
  resources :groups do
    resources :expenses
  end
end
