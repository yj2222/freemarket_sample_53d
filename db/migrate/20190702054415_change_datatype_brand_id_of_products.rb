class ChangeDatatypeBrandIdOfProducts < ActiveRecord::Migration[5.2]
  def change 
    change_column :products, :brand_id, :integer
  end
end
