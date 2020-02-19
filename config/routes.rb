Rails.application.routes.draw do
  get '/persist', to: 'users#persist'
  post '/login', to: 'users#login'

  resources :users
  resources :likes
  resources :comments
  resources :posts
  resources :topics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
