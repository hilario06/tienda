# == Schema Information
#
# Table name: product_likes
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductLike < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
