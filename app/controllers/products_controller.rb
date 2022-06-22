class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # def index
  #   if params[:query].present?
  #     @books = policy_scope(Book).where("title ILIKE ?  OR author ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")

  #   else
  #   @books = policy_scope(Book).order(created_at: :desc)
  #   end
  # end
  def index
    if params[:query].present?
      # @products = Product.where(title: params[:query])
      @products = Product.global_search(params[:query])
    else
      @products = Product.all
    end
  end

  def show
    @review = Review.new
    @shopping_cart_product = ShoppingCartProduct.new
    @reviews = @product.reviews.order('created_at DESC').includes([:user])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_url(@product), notice: "Producto creado"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_url(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :code, :stock, :price, :description, :category_id)
  end
end
