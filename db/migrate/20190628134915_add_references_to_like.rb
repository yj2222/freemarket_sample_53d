class AddReferencesToLike < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :user, foreign_key: true, null: false, index: true
    add_reference :likes, :product, foreign_key: true, null: false, index: true
  end
end
