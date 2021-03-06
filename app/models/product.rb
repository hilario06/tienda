# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  title       :string
#  code        :string
#  stock       :string           default("0")
#  price       :integer          default(0)
#  description :string
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  acts_as_paranoid  # de la gema paranoia

  belongs_to :category
  has_many :shopping_cart_products
  has_many :product_likes
  has_many :reviews
  has_many :product_user_reviews, through: :reviews, source: :user # no estoy usando de momento

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :description ],
    associated_against: {
      category: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
