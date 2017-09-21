module ApplicationHelper
  def number_to_currency(number)
    "$#{number.to_f/100}"
  end

  # def current_cart
  #   current_user.current_cart
  # end

  
end
