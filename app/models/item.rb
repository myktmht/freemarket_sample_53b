class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, length: { maximum: 40 }
end
