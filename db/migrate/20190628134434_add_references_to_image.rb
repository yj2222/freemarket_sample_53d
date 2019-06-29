class AddReferencesToImage < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :product, foreign_key: true, null: false, index: true
  end
end
