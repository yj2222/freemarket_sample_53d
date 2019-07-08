class Category < ApplicationRecord
  has_many :products

  enum parent: {
    "レディース": "レディース",
    "メンズ": "メンズ",
    "ベビー・キッズ": "ベビー・キッズ",
    "コスメ・香水・美容": "コスメ・香水・美容",
    "インテリア・住まい・小物": "インテリア・住まい・小物",
    "本・音楽・ゲーム": "本・音楽・ゲーム",
    "おもちゃ・ホビー・グッズ": "おもちゃ・ホビー・グッズ",
    "家電・スマホ・カメラ": "家電・スマホ・カメラ",
    "スポーツ・レジャー": "スポーツ・レジャー",
    "ハンドメイド": "ハンドメイド",
    "チケット": "チケット",
    "自動車・オートバイ": "自動車・オートバイ",
    "その他": "その他"
  },_suffix: true

  enum child: {
    "パンツ": "パンツ",
    "スカート": "スカート",
    "ワンピース": "ワンピース",
    "靴": "靴",
    "ルームウェア/パジャマ": "ルームウェア/パジャマ",
    "レッグウェア": "レッグウェア",
    "帽子": "帽子",
    "バッグ": "バッグ",
    "アクセサリー": "アクセサリー",
    "ヘアアクセサリー": "ヘアアクセサリー",
    "小物": "小物",
    "時計": "時計",
    "ウィッグ/エクステ": "ウィッグ/エクステ",
    "浴衣/水着": "浴衣/水着",
    "スーツ/フォーマル/ドレス": "スーツ/フォーマル/ドレス",
    "マタニティ": "マタニティ",
    "その他": "その他",
    "すべて": "すべて"
  },_suffix: true

  enum grandchild: {
    "Tシャツ/カットソー(半袖/袖なし)": "Tシャツ/カットソー(半袖/袖なし)",
    "Tシャツ/カットソー(七分/長袖)": "Tシャツ/カットソー(七分/長袖)",
    "シャツ/ブラウス(半袖/袖なし)": "シャツ/ブラウス(半袖/袖なし)",
    "シャツ/ブラウス(七分/長袖)": "シャツ/ブラウス(七分/長袖)",
    "ポロシャツ": "ポロシャツ",
    "キャミソール": "キャミソール",
    "タンクトップ": "タンクトップ",
    "ホルターネック": "ホルターネック",
    "ニット/セーター": "ニット/セーター",
    "チュニック": "チュニック",
    "カーディガン/ボレロ": "カーディガン/ボレロ",
    "アンサンブル": "アンサンブル",
    "ベスト/ジレ": "ベスト/ジレ",
    "パーカー": "パーカー",
    "トレーナー/スウェット": "トレーナー/スウェット",
    "ベアトップ/チューブトップ": "ベアトップ/チューブトップ",
    "ジャージ": "ジャージ",
    "その他": "その他"
  },_suffix: true

  


end
