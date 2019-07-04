class RemoveProductIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :product_id, :bigint
  end
end
