# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[]

  has_many :product_likes
  has_many :products_you_like, through: :product_likes, source: :product

  has_many :shopping_carts
  has_one :shopping_cart, -> { where(active:true).order('id DESC') }
  has_many :reviews
  has_many :charges

  def self.from_omniauth(auth)
    # This line checks if the user email received by the Omniauth is already included in our databases.
    user = User.where(email: auth.info.email).first
    # This line sets the user unless there is a user found in the line above, therefore we use ||= notation to evaluate if the user is nill, then set it to the User.create
    user ||= User.create!(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0, 20])
    user
  end
end
