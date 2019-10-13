class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :images, inverse_of: :item, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :name, length: { maximum: 40 }
end
