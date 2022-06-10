class ShoppingCartProductsController < ApplicationController
  def create
    @shopping_cart_product = ShoppingCartProduct.new
    @shopping_cart_product.product_id = params[:product_id]
    @shopping_cart_product.shopping_cart_id = current_user.shopping_cart.id # crear una validacion cuando el usuario no tiene carrito
    add_quantity # method
    if @shopping_cart_product.save
      redirect_to product_url(params[:product_id]), notice: "Producto agregado al carrito"
    else
      # redirect_to product_path(params[:product_id])
      redirect_to product_path params[:product_id]
    end
  end

  private

  def add_quantity
    if params[:shopping_cart_product]
      @shopping_cart_product.quantity = params[:shopping_cart_product][:quantity]
    else
      @shopping_cart_product.quantity = params[:quantity]
    end
  end
end
