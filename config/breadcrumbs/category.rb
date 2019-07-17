crumb :root do
  link "メルカリ", root_path
end

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :categories_parent do |category|
  link "#{category.parent}", category_path
  parent :categories 
end
