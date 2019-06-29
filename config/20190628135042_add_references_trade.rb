class AddReferencesTrade < ActiveRecord::Migration[5.2]
  def change
    add_reference :trades, :user, foreign_key: true, null: false, index: true
    add_reference :trades, :product, foreign_key: true, null: false, index: true
    # add_reference :trades, :seller, foreign_key: true, null: false, index: true
  end
end
