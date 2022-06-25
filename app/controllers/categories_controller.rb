class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index

    @categories = policy_scope(Category)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url, notice: "Categoria creado"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_url
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
