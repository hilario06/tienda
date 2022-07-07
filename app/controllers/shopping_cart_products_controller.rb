class ShoppingCartProductsController < ApplicationController

  def create
    route = is_the_route # method
    return redirect_to route, notice: 'El producto ya fue agregado' if is_product_add?

    @shopping_cart_product = ShoppingCartProduct.new
    @shopping_cart_product.product_id = params[:product_id]
    shopping_cart = current_user.shopping_cart
    unless shopping_cart
      shopping_cart = ShoppingCart.create(user:current_user, active:true)
    end
    @shopping_cart_product.shopping_cart_id = shopping_cart.id
    add_quantity # method
    if @shopping_cart_product.save
      redirect_to route, notice: "Producto agregado al carrito"
    else
      # redirect_to product_path(params[:product_id])
      redirect_to route
    end
  end

  def is_the_route
    if params[:add_cart_from]
      # add_cart_from (1: home, 2: list products, 3: show products)
      case params[:add_cart_from].to_i
      when 1
        root_path
      when 2
        products_path
      end
    else
      product_path(params[:product_id])
    end
  end

  def update
    shopping_cart_product = ShoppingCartProduct.find(params[:id])
    quantity = shopping_cart_product.quantity + params[:quantity].to_i
    shopping_cart_product.update(quantity: quantity)
    redirect_to shopping_carts_path
  end

  def destroy
    shopping_cart_product = ShoppingCartProduct.find(params[:id])
    shopping_cart_product.destroy
    redirect_to shopping_carts_path
  end

  private

  def add_quantity
    if params[:shopping_cart_product]
      @shopping_cart_product.quantity = params[:shopping_cart_product][:quantity]
    else
      @shopping_cart_product.quantity = params[:quantity]
    end
  end

  def is_product_add?
    @shopping_cart_product = ShoppingCartProduct.find_by(product_id: params[:product_id], shopping_cart_id: current_user.shopping_cart)
  end
end
