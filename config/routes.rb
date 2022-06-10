Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :categories
  resources :products do
    resources :reviews, only: :create
    resources :shopping_cart_products, only: :create
  end
  resources :product_likes, only: %i[index create destroy]
  resources :reviews, only: :destroy
  resources :shopping_carts, only: %i[index]
  resources :shopping_cart_products, only: %i[create destroy]
end
