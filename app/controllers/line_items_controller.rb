class LineItemsController < ApplicationController

  def create
    
    if user_signed_in? && current_cart.blank?
      current_user.current_cart = current_user.carts.create
    end
    current_cart.add_item(params[:item_id])
    # raise current_cart.inspect
    current_cart.save
    current_user.save
    redirect_to cart_path(current_cart)
  end
end

#params[:item_id]