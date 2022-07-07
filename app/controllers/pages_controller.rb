class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @categories = Category.all
    @products = Product.pluck(:id,:title,:description).shuffle[0..2]
  end
end
