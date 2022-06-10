class ReviewsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = product
    @review.user = current_user
    if @review.save
      redirect_to product
    else
      # render "products/#{product}"
      # render 'products/show'
      redirect_to product_path(params[:product_id])
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(params[:product_id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
