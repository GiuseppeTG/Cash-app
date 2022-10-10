Rails.application.routes.draw do
  root 'splash#index'
  devise_for :users
  resources :groups, only: %i[index new create]
  resources :expenses, only: %i[index new create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
