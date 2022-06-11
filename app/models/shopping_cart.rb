# == Schema Information
#
# Table name: shopping_carts
#
#  id         :bigint           not null, primary key
#  total      :integer          default(0)
#  status     :integer          default(0)
#  active     :boolean          default(FALSE)
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_products
  has_many :products, through: :shopping_cart_products

  def update_total!
    self.update(total: self.get_total)
  end

  def get_total
    Product.joins(:shopping_cart_products)
    .where(shopping_cart_products: { shopping_cart_id: self.id })
    .select('SUM(products.price * shopping_cart_products.quantity) AS t')[0].t
  end
end
