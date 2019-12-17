class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :card, optional: true
  
  validates :name, length: { maximum: 40 }

  enum condition:{
    "新品、未使用": 1,
    "未使用に近い": 2,
    "目立った傷や汚れなし": 3,
    "やや傷や汚れあり": 4,
    "傷や汚れあり": 5,
    "全体的に状態が悪い": 6
  }

  enum shipping_fee:{
    "送料込み(出品者負担)": 1,
    "着払い(購入者負担)": 2
  }

  enum shipping_method:{
    "未定": 1,
    "クロネコヤマト": 2,
    "ゆうパック": 3,
    "ゆうメール": 4
  }

  enum days_before_shipping:{
    "1~2日で発送": 1,
    "2~3日で発送": 2,
    "4~7日で発送": 3
  }
end
