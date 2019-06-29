class AddReferencesToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :user, foreign_key: true, null: false, index: true
    add_reference :products, :category, foreign_key: true, null: false, index: true
  end
end


