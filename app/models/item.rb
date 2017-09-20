class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items

  def self.available_items
    @items = Item.where.not(inventory: 0)  
  end

  def price_to_currency
    "$#{self.price.to_f/100}"
  end
end


