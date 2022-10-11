Rails.application.routes.draw do
  root 'splash#index'
  devise_for :users
  resources :groups do
    resources :expenses
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
