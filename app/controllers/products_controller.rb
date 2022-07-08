class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    # listar productos (1:eliminados, 2: productos no eliminados)
    if params[:is_removed_products]
      return @products = params[:is_removed_products].to_i == 1 ? Product.only_deleted : Product.all
    end

    if params[:query].present?
      # busqueda con pg_search
      @products = Product.global_search(params[:query])
    else
      @products = Product.all
    end
  end

  def show
    @review = Review.new
    @shopping_cart_product = ShoppingCartProduct.new
    if user_signed_in?
      @reviews = @product.reviews.order('created_at DESC').includes([:user])
    else
      @reviews = @product.reviews.order('created_at DESC')
    end
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
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
    # verificando si el producto esta en algun carrito activo
    if ShoppingCartProduct.joins(:shopping_cart).where(shopping_cart: {active: true}).pluck('product_id').uniq.include?(params[:id].to_i)
      redirect_to products_url, notice: 'No se pudo eliminar porque esta en un carrito'
    else
      @product.destroy
      redirect_to products_url, notice: 'Producto eliminado'
    end
  end

  def restore
    @product = Product.restore(params[:product_id])
    authorize @product
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:title, :code, :stock, :price, :description, :category_id)
  end
end
