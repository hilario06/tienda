# == Schema Information
#
# Table name: charges
#
#  id               :bigint           not null, primary key
#  uid              :string(50)
#  status           :integer          default(0)
#  payment_method   :integer          default(0)
#  amount           :decimal(, )      default(0.0)
#  error_message    :text
#  response_data    :jsonb
#  user_id          :bigint           not null
#  shopping_cart_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class ChargeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
