Rails.application.routes.draw do
  get 'render/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :splash
  resources :groups do 
    resources :movements
  end
  root "splash#index"
end
