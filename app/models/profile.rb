class Profile < ApplicationRecord
  belongs_to :user
  # バリデーション
  validates :birth_year,     presence: true
  validates :birth_month,    presence: true
  validates :birth_day,      presence: true
  validates :last_name,      presence: true, length: {maximum: 35}
  validates :first_name,     presence: true, length: {maximum: 35}
  validates :last_name_kana, presence: true, length: {maximum: 35}
  validates :phone_number,                   length: {maximum: 100}
end
