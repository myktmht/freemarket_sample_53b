# item一覧
item_id = 1
# ユーザー「test1」がレディースカテゴリのアイテムを3つ作成
while item_id <= 3
  test_item = Item.create(name: "test#{item_id}", price: 10000, description: "test#{item_id}新品です", condition: 1,  shipping_fee: 1, days_before_shipping: 1, shipping_method: 1, trade_status: 1, user_id: 1, category_id: 1, size_id: 3, brand_id: 4)
  image = Image.create(name: "download.png", item_id: item_id)
  item_id += 1
end

# ユーザー「test2」がメンズカテゴリのアイテムを3つ作成
while item_id <= 6
  test_item = Item.create(name: "test#{item_id}", price: 20000, description: "test#{item_id}中古です", condition: 1,  shipping_fee: 1, days_before_shipping: 1, shipping_method: 1, trade_status: 0, user_id: 2, category_id: 2, size_id: 2, brand_id: 5)
  image = Image.create(name: "download1.png", item_id: item_id)
  item_id += 1
end

# ユーザー「test3」がレディースカテゴリのアイテムを4つ作成
while item_id <= 10
  test_item = Item.create(name: "test#{item_id}", price: 30000, description: "test#{item_id}未開封品", condition: 2,  shipping_fee: 1, days_before_shipping: 1, shipping_method: 1, trade_status: 2, user_id: 3, category_id: 1, size_id: 1, brand_id: 3)
  image = Image.create(name: "download2.png", item_id: item_id)
  item_id += 1
end

# ユーザー「test1」がおもちゃカテゴリのアイテムを10作成
while item_id <= 20
  test_item = Item.create(name: "test#{item_id}", price: 2500, description: "test#{item_id}中古です", condition: 1,  shipping_fee: 1, days_before_shipping: 1, shipping_method: 1, trade_status: 0, user_id: 1, category_id: 6, size_id: 2, brand_id: 5)
  image = Image.create(name: "download3.png", item_id: item_id)
  item_id += 1
end

# ユーザー「test2」がカメラカテゴリのアイテムを10作成
while item_id <= 30
  test_item = Item.create(name: "test#{item_id}", price: 15000, description: "test#{item_id}中古です", condition: 1,  shipping_fee: 1, days_before_shipping: 1, shipping_method: 1, trade_status: 0, user_id: 2, category_id: 8, size_id: 2, brand_id: 4)
  image = Image.create(name: "download4.png", item_id: item_id)
  item_id += 1
end



# カテゴリー一覧
categories_id = 1
categories = ['レディース','メンズ','ベビー・キッズ','インテリア・住まい・小物','本・音楽・ゲーム','おもちゃ・ホビー・グッズ','コスメ・香水・美容','家電・スマホ・カメラ','スポーツ・レジャー','ハンドメイド','チケット','自動車・オートバイ','その他']
while categories_id <= 13
  categories.each do |category|
    Category.create(name: category)
    categories_id += 1
  end
end

# サイズ一覧
sizes_id = 1
sizes = ['S', 'M', 'L', 'LL', 'XL']
while sizes_id <= 5
  sizes.each do |size|
    Size.create(name: size)
    sizes_id += 1
  end
end

# ブランド一覧
brands_id = 1
brands = ['シャネル', 'ナイキ', 'ルイ ヴィトン', 'シュプリーム', 'アディダス']
while brands_id <= 5
  brands.each do |brand|
    Brand.create(name: brand)
    brands_id += 1
  end
end