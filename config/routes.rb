Rails.application.routes.draw do
  get 'product_likes/index'
  devise_for :users
  root to: "pages#home"
  resources :categories
  resources :products do
    resources :reviews, only: :create
  end
  resources :product_likes, only: %i[index create destroy]
  resources :reviews, only: :destroy
  resources :shopping_carts, only: %i[index]
end
