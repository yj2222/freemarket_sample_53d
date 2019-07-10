class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,           null: false
      t.text :description,      null: false
      t.string :size,           null: false
      t.string :delivery_price, null: false
      t.string :delivery_type,  null: false
      t.string :prefecture,     null: false
      t.string :delivery_days,  null: false
      t.integer :price,         null: false
      t.string :condition,      null: false
      t.references :user,       null: false, index: true, foreign_key: true
      t.references :category,   null: false, index: true, foreign_key: true
      t.references :brand,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
