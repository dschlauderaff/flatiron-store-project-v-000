class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       
  has_many :orders       
  has_many :carts, through: :orders
  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'cart_id'

end
