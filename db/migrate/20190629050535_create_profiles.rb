class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :firstname_kanji, null: false
      t.string :lastname_kanji, null: false
      t.string :firstname_katakana, null: false
      t.string :lastname_katakana, null: false
      t.string :birth_year, null: false
      t.string :birth_month, null: false
      t.string :birth_day, null: false
      t.integer :phone_number
      t.integer :good
      t.integer :normal
      t.integer :bad
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
