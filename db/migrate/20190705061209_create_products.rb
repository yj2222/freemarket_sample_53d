class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :size
      t.references :brand, index: true, foreign_key: true
      t.string :delivery_price
      t.string :delivery_type
      t.string :prefecture
      t.string :delivery_days
      t.integer :price
      t.string :condition
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end
