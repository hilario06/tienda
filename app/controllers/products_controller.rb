class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def update
  end

  def edit
  end

  def delete
  end

  private
  def product_params
    params.require(:product).permit(:title, :code, :stock, :price, :description, :category_id)
  end
end
