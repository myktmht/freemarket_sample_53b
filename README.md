
# DB設計

## usersテーブル

|Column|Type|Option|
|------|----|------|
|nickname|string|null: false, unique: true, index: true|
|email|string|null: false, unique;: true|
|password|string|---|
|item_id|references|foreign_key: true|

### Association
* has_many :comments
* has_many :items
* has_many :likes
* has_many :sns_credentials
* has_many :reviews
* has_one :card
* has_one :profile
* has_one :address

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||---|
|last_name|string|---|
|first_name|string|---|
|last_name_kana|string|---|
|first_name_kana|string|---|
|birth_year|integer|---|
|birth_month|integer|---|
|birth_day|integer|---|
|phone_numder|integer|unique: true|
|user_id|references|null: false, index: true, foreign_key: true|

### Association
* belongs_to :user

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|zipcode|integer|---|
|prefecture|integer|---|
|city|string|---|
|block|string|---|
|building|string|---|
|user_id|references|null: false, index: true, foreign_key: true|

### Association
* belongs_to :user


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|references|foreign_key: true|
|card_id|references|foreign_key: true|

### Association
* belongs_to :user

## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|uid|string|null: false, unique: true|
|provider|string|null: false|
|token|text|---|
|user_id|references|null: false, index: true, foreign_key: true|

### Association
* belongs_to :user


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|items_id|references|null: false, index: true, foreign_key: true|
|user_id|references|null: false, index: true, foreign_key: true|

### Association
* belongs_to :item
* belongs_to :user

##commentsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|item_id|references|null: false, index: true, foreign_key: true|
|user_id|references|null: false, index: true, foreign_key: true|

### Association
* belongs_to :item
* belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|description|text|null: false|
|condition|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_from|integer|null: false|
|days_before_shipping|integer|null: false|
|shipping_method|integer|null: false|
|trade_status|integer|default(0)|
|brand_id|references|index: true, foreign_key: true|
|category_id|references|null: false, index: true, foreign_key: true|
|user_id|references|null: false, index: true, foreign_key: true|
|size_id|references|null: false, index: true, foreign_key: true|

### Association
* belongs_to :brand
* belongs_to :category
* belongs_to :user
* belongs_to :size
* has_many :contents
* has_many :images
* has_many :likes

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|brand_group_id|references|index: true, foreign_key: true|

### Association
* belongs_to :brand_group
* has_many :items

## brand_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
* has_many :brands

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|null: false, index: true, foreign_key: true|

### Association
* belongs_to :item

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|parent_id|references|null: false, index: true, foreign_key: true|

### Association
* belongs_to :parent, class_name: "Category"
* has_many :items
* has_many :child, class_name: "Category", foreign_key: "parent_id"
* has_many :size_charts
* has_many :sizes, through: :size_charts

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
* has_many :categories, through: :size_charts
* has_many :items
* has_many :size_charts

## size_chartsテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, index: true, foreign_key: true|
|size_id|references||null: false, index: true, foreign_key: true|

### Association
* belongs_to :category
* belongs_to :size

## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|---|
|value|integer|null: false|
|user_id|references|null: false, index: true, foreign_key: true|

### Association
* belongs_to :user