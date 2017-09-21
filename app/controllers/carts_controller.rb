class CartsController < ApplicationController

 

  def show
  end

  def checkout
    current_cart.checkout
    current_cart.destroy
    flash[:notice] = "Your cart was successfully ordered."
    redirect_to cart_path(current_cart)
  end


end
