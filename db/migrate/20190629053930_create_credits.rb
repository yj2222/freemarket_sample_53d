class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.integer :number, null: false
      t.integer :month, null: false
      t.integer :year, null: false
      t.integer :security_code, null: false
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
