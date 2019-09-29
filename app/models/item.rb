class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :images
  
  validates :name, length: { maximum: 40 }
end
