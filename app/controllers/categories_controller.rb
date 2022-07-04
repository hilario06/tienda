class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = policy_scope(Category)
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to categories_url, notice: "Categoría creado"
    else
      render :new
    end
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    if @category.update(category_params)
      redirect_to categories_url
    else
      render :edit
    end
  end

  def destroy
    authorize @category
    @category.destroy
    redirect_to categories_url
  end

  def restore
    @category = Category.restore(params[:category_id])
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
