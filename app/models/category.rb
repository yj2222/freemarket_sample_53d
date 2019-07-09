class Category < ApplicationRecord
  has_many :products

  enum grandchild: {
    "Tシャツ/カットソー(半袖/袖なし)": 1,
    "Tシャツ/カットソー(七分/長袖)": 2,
    "シャツ/ブラウス(半袖/袖なし)": 3,
    "シャツ/ブラウス(七分/長袖)": 4,
    "ポロシャツ": 5,
    "キャミソール": 6,
    "タンクトップ": 7,
    "ホルターネック": 8,
    "ニット/セーター": 9,
    "チュニック": 10,
    "カーディガン/ボレロ": 11,
    "アンサンブル": 12,
    "ベスト/ジレ": 13,
    "パーカー": 14,
    "トレーナー/スウェット": 15,
    "ベアトップ/チューブトップ": 16,
    "ジャージ": 17,
    "その他": 18
  },_suffix: true

end
