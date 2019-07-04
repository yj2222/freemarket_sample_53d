class RemoveProductIdToBrands < ActiveRecord::Migration[5.2]
  def change 
    remove_column :brands, :product_id, :integer
  end
end
