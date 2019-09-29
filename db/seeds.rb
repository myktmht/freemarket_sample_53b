require "csv"

CSV.foreach('db/csv/category.csv', headers: true) do |row|
  Category.create!(
    name: row['name'],
    parent_id: row['parent_id']
  )
end

# item一覧
item_id = 1
# ユーザー「test1」がレディースカテゴリのアイテムを3つ作成
while item_id <= 3
  test_item = Item.create!(name: "test#{item_id}", price: 10000, description: "test#{item_id}新品です", condition: 1,  shipping_fee: 1, shipping_from: 1, days_before_shipping: 1, shipping_method: 1, trade_status: 1, user_id: 1, category_id: 1)
  image = Image.create!(name: "download.png", item_id: item_id)
  item_id += 1
end

# ユーザー「test2」がメンズカテゴリのアイテムを3つ作成
while item_id <= 6
  test_item = Item.create!(name: "test#{item_id}", price: 20000, description: "test#{item_id}中古です", condition: 1,  shipping_fee: 1, shipping_from: 2, days_before_shipping: 1, shipping_method: 1, trade_status: 0, user_id: 2, category_id: 199)
  image = Image.create!(name: "download1.png", item_id: item_id)
  item_id += 1
end

# ユーザー「test3」がレディースカテゴリのアイテムを4つ作成
while item_id <= 10
  test_item = Item.create!(name: "test#{item_id}", price: 30000, description: "test#{item_id}未開封品", condition: 2,  shipping_fee: 1, shipping_from: 1, days_before_shipping: 1, shipping_method: 1, trade_status: 2, user_id: 3, category_id: 1)
  image = Image.create!(name: "download2.png", item_id: item_id)
  item_id += 1
end

# ユーザー「test1」がおもちゃカテゴリのアイテムを10作成
while item_id <= 20
  test_item = Item.create!(name: "test#{item_id}", price: 2500, description: "test#{item_id}中古です", condition: 1,  shipping_fee: 1, shipping_from: 2, days_before_shipping: 1, shipping_method: 1, trade_status: 0, user_id: 1, category_id: 679)
  image = Image.create!(name: "download3.png", item_id: item_id)
  item_id += 1
end

# ユーザー「test2」がカメラカテゴリのアイテムを10作成
while item_id <= 30
  test_item = Item.create!(name: "test#{item_id}", price: 15000, description: "test#{item_id}中古です", condition: 1,  shipping_fee: 1, shipping_from: 1, days_before_shipping: 1, shipping_method: 1, trade_status: 0, user_id: 2, category_id: 892)
  image = Image.create!(name: "download4.png", item_id: item_id)
  item_id += 1
end