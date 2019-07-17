class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :grandchild
      t.string :child
      t.string :parent
      t.timestamps
    end
  end
end
