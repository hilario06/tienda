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
class Charge < ApplicationRecord
  belongs_to :user
  belongs_to :shopping_cart

  enum status: [:created, :pending, :paid, :rejected, :error]
  enum payment_method: [:unknown, :credit_card, :debit_card, :pse, :cash, :referenced, :transfer]

  before_create :generate_uid

  private

  def generate_uid
    begin
      self.uid = SecureRandom.hex(5)
    end while self.class.exists?(uid: self.uid)
  end
end
