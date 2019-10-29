class User < ApplicationRecord
    has_many :items  
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    has_many :cards
    has_one :profile
    has_one :address
  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,}+\z/i
    validates :nickname, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 7 }, format: { with: PASSWORD_VALIDATION }
  end