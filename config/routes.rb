Rails.application.routes.draw do
  resources :comments
  resources :ratings
  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#login'
  get '/authorize', to: 'sessions#auto_login'

  resources :users, only: [:create]


  # Defines the root path route ("/")
  # root "articles#index"
end
