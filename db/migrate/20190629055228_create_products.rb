class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :size
      t.string :brand
      t.string :delivery_price
      t.string :delivery_type
      t.string :prefecture
      t.string :delively_days
      t.integer :price
      t.integer :condition
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
