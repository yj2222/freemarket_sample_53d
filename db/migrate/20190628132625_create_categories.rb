class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :parent, null: false
      t.string :child
      t.string :son
      t.timestamps
    end
  end
end
