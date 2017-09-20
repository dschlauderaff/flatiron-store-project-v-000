module ApplicationHelper
  def number_to_currency(number)
    "$#{number.to_f/100}"
  end
end
