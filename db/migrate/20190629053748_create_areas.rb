class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.integer :post_number, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :address_number, null: false
      t.string :building
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
