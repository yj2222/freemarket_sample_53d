class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.references :product, index: true, foreign_key: true
      t.timestamps
    end
  end
end
