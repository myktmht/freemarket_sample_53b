class Address < ApplicationRecord
  belongs_to :user
  POSTAL_CODE_VALID = /\A\d{3}-\d{4}\z/i
  # バリデーション
  validates :zipcode,    presence: true, length: {maximum: 100}, format: { with: POSTAL_CODE_VALID }
  validates :prefecture, presence: true, length: {maximum: 100}
  validates :city,       presence: true, length: {maximum: 50}
  validates :block,      presence: true, length: {maximum: 100}
  validates :building,   presence: true, length: {maximum: 100}
end
