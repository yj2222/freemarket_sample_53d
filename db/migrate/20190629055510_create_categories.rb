class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :parent, null: false
      t.string :child
      t.string :son
      t.references :product, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
