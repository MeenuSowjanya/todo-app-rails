Rails.application.routes.draw do
 
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # match "todos", to: "todos#index", via: :get
  # match "todos", to: "todos#create", via: :post
  # match "todos/:id", to: "todos#update", via: :put
  # match "todos/:id", to: "todos#destroy", via: :delete

  # match "register", to: "users#index", via: :get
  # match "users/create", to: "users#create", via: :post
  # match "login", to: "users#login", via: :get
  # match "users/login_check", to: "users#login_check", via: :post

  root "home#index"
  
  resources :todos
  resources :users
  match "signin", to: "sessions#new", via: :get, as: :new_sessions
  match "signin", to: "sessions#create", via: :post, as: :sessions
end
