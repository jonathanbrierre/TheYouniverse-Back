Rails.application.routes.draw do
  resources :followings
  get '/persist', to: 'users#persist'
  post '/login', to: 'users#login'

  # get '/posts/spirituality/:page', to: 'posts#spirituality'
  # get '/posts/love/:page', to: 'posts#love'
  # get '/posts/discipline/:page', to: 'posts#discipline'
  # get '/posts/philosophy/:page', to: 'posts#philosophy'
  # get '/posts/positivity/:page', to: 'posts#positivity'

  get '/posts/:slug/:page', to: 'posts#infinite_scroll'
  get '/get_comments/:post_id', to: 'comments#post_comments'
  get '/profile/:id', to: 'users#profile'

  resources :users
  resources :likes
  resources :comments
  resources :posts
  resources :topics
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
