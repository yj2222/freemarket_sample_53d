class Category < ApplicationRecord
  has_many :products

  # enum parent: {
  #   "レディース": "レディース",
  #   "メンズ": "メンズ",
  #   "ベビー・キッズ": "ベビー・キッズ",
  #   "コスメ・香水・美容": "コスメ・香水・美容",
  #   "インテリア・住まい・小物": "インテリア・住まい・小物",
  #   "本・音楽・ゲーム": "本・音楽・ゲーム",
  #   "おもちゃ・ホビー・グッズ": "おもちゃ・ホビー・グッズ",
  #   "家電・スマホ・カメラ": "家電・スマホ・カメラ",
  #   "スポーツ・レジャー": "スポーツ・レジャー",
  #   "ハンドメイド": "ハンドメイド",
  #   "チケット": "チケット",
  #   "自動車・オートバイ": "自動車・オートバイ",
  #   "その他": "その他"
  # },_suffix: true

  # enum child: {
  #   "トップス": "トップス",
  #   "ジャケット/アウター": "ジャケット/アウター",
  #   "パンツ": "パンツ",
  #   "スカート": "スカート",
  #   "ワンピース": "ワンピース",
  #   "靴": "靴",
  #   "ルームウェア/パジャマ": "ルームウェア/パジャマ",
  #   "レッグウェア": "レッグウェア",
  #   "帽子": "帽子",
  #   "バッグ": "バッグ",
  #   "アクセサリー": "アクセサリー",
  #   "ヘアアクセサリー": "ヘアアクセサリー",
  #   "その他": "その他"
  # },_suffix: true

  # enum grandchild: {
  #   "Tシャツ/カットソー(半袖/袖なし)": 1,
  #   "Tシャツ/カットソー(七分/長袖)": 2,
  #   "シャツ/ブラウス(半袖/袖なし)": 3,
  #   "シャツ/ブラウス(七分/長袖)": 4,
  #   "ポロシャツ": 5,
  #   "キャミソール": 6,
  #   "タンクトップ": 7,
  #   "ホルターネック": 8,
  #   "ニット/セーター": 9,
  #   "チュニック": 10,
  #   "カーディガン/ボレロ": 11,
  #   "アンサンブル": 12,
  #   "ベスト/ジレ": 13,
  #   "パーカー": 14,
  #   "トレーナー/スウェット": 15,
  #   "ベアトップ/チューブトップ": 16,
  #   "ジャージ": 17,
  #   "その他": 18
  # },_suffix: true

end
