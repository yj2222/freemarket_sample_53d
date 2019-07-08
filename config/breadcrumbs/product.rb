crumb :root do
  link "メルカリ", root_path
end

crumb :product_details do |product|
  link "#{product.name}", product_path
  parent :root
end