class RemoveProductIdToCategories < ActiveRecord::Migration[5.2]
  def change 
    remove_column :categories, :product_id, :references
  end
end
