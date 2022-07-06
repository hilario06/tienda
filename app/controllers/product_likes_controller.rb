class ProductLikesController < ApplicationController

  def index
    @product_likes = current_user.products_you_like
  end

  def create
    product_likes = ProductLike.find_by(product_id: params[:product], user_id: current_user)
    message_notice = 'Ya fue añadido a la lista de deseos'
    unless product_likes
      ProductLike.create(product_id: params[:product], user: current_user)
      message_notice = 'Añadido a la lista de deseos'
    end

    # a_like_from (1: lista de productos, 2: show products, 3: shopping cart)
    case params[:a_like_from].to_i
    when 1
      redirect_to products_path, notice: message_notice
    when 2
      redirect_to product_path(params[:product]), notice: message_notice
    when 3
      redirect_to shopping_carts_path, notice: message_notice
    end
  end

  def destroy
    product_id = params[:id]
    @product_likes = ProductLike.find_by(product_id: product_id, user_id: current_user)
    @product_likes.destroy
    redirect_to product_likes_url
  end
end
