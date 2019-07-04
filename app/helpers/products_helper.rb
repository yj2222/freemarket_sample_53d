module ProductsHelper 
  def number_to_currency(price)
    "¥#{price.to_s(:delimited, delimiter: ',')}"
  end 

  # def item_add_tax(price)
  #   price = 
  # end
end
