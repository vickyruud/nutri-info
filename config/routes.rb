Rails.application.routes.draw do
  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'
  get '/authorize', to: 'sessions#show'

  resources :users, only: [:create]


  # Defines the root path route ("/")
  # root "articles#index"
end
