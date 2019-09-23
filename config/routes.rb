Rails.application.routes.draw do
  resources :posts
  
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  post 'posts/new', to: 'post#create'
  
  get 'users/index'
  get 'users/show'
  devise_for :users

  root to: "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
