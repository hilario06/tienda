Rails.application.routes.draw do
  get 'product_likes/index'
  devise_for :users
  root to: "pages#home"
  resources :categories
  resources :products
  resources :product_likes, only: %i[index create destroy]
end
