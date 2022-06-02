class ProductLikesController < ApplicationController

  def index
    @product_likes = current_user.products_you_like
  end

  def create
    product_likes = ProductLike.find_by(product_id: params[:product], user_id: current_user)
    unless product_likes
      ProductLike.create(product_id: params[:product], user: current_user)
    end
  end

  def destroy
    product_id = params[:id]
    @product_likes = ProductLike.find_by(product_id: product_id, user_id: current_user)
    @product_likes.destroy
    redirect_to product_likes_index_url
  end
end
