# == Schema Information
#
# Table name: shopping_cart_products
#
#  id               :bigint           not null, primary key
#  quantity         :integer          default(1)
#  shopping_cart_id :bigint           not null
#  product_id       :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class ShoppingCartProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
