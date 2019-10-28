Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :posts
  resources :users, only: [:index, :show]
  resources :comments
  resources :likes
  resources :friendships

  post 'friendships/:id', to: 'friendships#update'

  root to: "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
