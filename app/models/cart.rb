class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  has_one :order
  

  def total
    line_items.collect {|li| li.price * li.quantity}.sum
  end

  def add_item(item_id)
    item = Item.find_by(id: item_id)
    
    if line_item = LineItem.find_by(item_id: item, cart_id: self)
      line_item.increment!(:quantity)
    else
      self.line_items.build(item: item)
    end    
  end

  def checkout
    line_items.each do |li|
      adjustment = li.item.inventory - li.quantity
      li.item.update(inventory: adjustment)
    end
    update(status: "submitted")
  end

  def fulfilled?
    self.status == "submitted"
  end 
end
