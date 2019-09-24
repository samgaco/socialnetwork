Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:index, :show]
  devise_for :users  

  root to: "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
