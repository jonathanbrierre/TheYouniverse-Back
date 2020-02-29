Rails.application.routes.draw do
  get '/persist', to: 'users#persist'
  post '/login', to: 'users#login'
  
  get '/posts/:slug/:page', to: 'posts#infinite_scroll'
  get '/get_comments/:post_id', to: 'comments#post_comments'
  get '/profile/:id', to: 'users#profile'
  get '/conversations/:userId', to: 'conversations#user_convos'
  get '/messages/:convoId', to: 'conversations#messages'
  get '/messages/:convoId/:userId', to: 'conversations#other_user'

  
  resources :users
  resources :likes
  resources :comments
  resources :posts
  resources :topics
  resources :conversations
  resources :messages
  resources :followings

  mount ActionCable.server => '/cable'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
