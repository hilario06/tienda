class ShoppingCartProductsController < ApplicationController
  before_action :set_shopping_cart_product, only: %i[ update destroy ]

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

    # actualizando stock producto
    product = Product.find(params[:product_id])
    new_product_stock = product.stock.to_i - @shopping_cart_product.quantity

    if new_product_stock >= 0 && @shopping_cart_product.save
      product.update(stock: new_product_stock)
      redirect_to route, notice: "Producto agregado al carrito"
    else
      redirect_to route, notice: 'Producto no hay en stock'
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
    quantity = @shopping_cart_product.quantity
    new_quantity = quantity + params[:quantity].to_i
    # actualizando stock producto
    product = Product.find(@shopping_cart_product.product.id)
    new_product_stock = product.stock.to_i + quantity - new_quantity
    if new_product_stock >= 0
      product.update(stock: new_product_stock)
      @shopping_cart_product.update(quantity: new_quantity)
      redirect_to shopping_carts_path
    else
      redirect_to shopping_carts_path, notice: 'Producto no hay en stock'
    end
  end

  def destroy
    # actualizando stock producto
    product = Product.find(@shopping_cart_product.product.id)
    product.update(stock: product.stock.to_i + @shopping_cart_product.quantity)

    @shopping_cart_product.destroy
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

  def set_shopping_cart_product
    @shopping_cart_product = ShoppingCartProduct.find(params[:id])
  end
end
