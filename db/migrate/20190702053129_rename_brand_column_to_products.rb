class RenameBrandColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :brand, :brand_id
  end
end
