class ShoppingCartsController < ApplicationController
  def index
    shopping_cart = current_user.shopping_cart
    unless shopping_cart
      shopping_cart = ShoppingCart.create!(user:current_user, active:true)
    end
    @products = shopping_cart.products
  end
end
