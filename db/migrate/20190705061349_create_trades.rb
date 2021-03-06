class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.references :buyer,   index: true, foreign_key: { to_table: :users }
      t.references :seller,  null: false, index: true, foreign_key: { to_table: :users }
      t.references :product, null: false, index: true, foreign_key: true
      t.integer :flug,       null: false
      t.timestamps
    end
  end
end