class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images

  validates :name, length: { maximum: 40 }
end
