Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:index, :show]
  devise_for :users
  
  
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  post 'posts/new', to: 'post#create'
  


  root to: "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
