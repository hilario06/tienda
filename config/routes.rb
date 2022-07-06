Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :categories do
    # categories/:category_id/restore
    post 'restore'
  end
  resources :products do
    resources :reviews, only: :create
    resources :shopping_cart_products, only: :create # creando desde el show product
    # products/:product_id/restore
    post 'restore'
  end
  resources :product_likes, only: %i[index create destroy]
  resources :reviews, only: :destroy
  resources :shopping_carts, only: %i[index]
  resources :shopping_cart_products, only: %i[create destroy update]
  resources :charges, only: %i[index create]
  # resources :charges
  get "payu/response", to: "payu#result"
  post "payu/confirmation", to: "payu#confirmation"
end
