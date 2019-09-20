class Item < ApplicationRecord
  belongs_to :user
  belongs_to :size
  belongs_to :category
  has_many :images
end
