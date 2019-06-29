class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :size, null: false
      t.string :brand
      t.string :delibary_price, null: false
      t.string :delibary_type, null: false
      t.string :prefecture, null: false
      t.string :delivaly_days, null: false
      t.integer :price, null: false
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
