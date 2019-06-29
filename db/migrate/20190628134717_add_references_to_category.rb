class AddReferencesToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :product, foreign_key: true, null: false, index: true
  end
end
