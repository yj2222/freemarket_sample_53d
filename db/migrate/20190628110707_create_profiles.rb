class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :firstname_kanji, null: false
      t.string :lastname_kanji, null: false
      t.string :firstname_katakana, null: false
      t.string :lastname_katakana, null: false
      t.string :birth_yaer, null: false
      t.string :birth_month, null: false
      t.string :birth_day, null: false
      t.integer :phone_number
      t.timestamps
    end
  end
end
