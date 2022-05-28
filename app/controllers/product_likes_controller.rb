class ProductLikesController < ApplicationController
  def index
    @product_likes = current_user.products
  end

  def create
    product_likes = ProductLike.find_by(product_id: params[:product], user_id: current_user)
    unless product_likes
      ProductLike.create(product_id: params[:product], user: current_user)
    end
  end

  def destroy

  end
end
