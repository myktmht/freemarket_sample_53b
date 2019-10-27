class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  has_many :images
  
  validates :name, length: { maximum: 40 }
end
