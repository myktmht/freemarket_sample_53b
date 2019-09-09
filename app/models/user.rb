class User < ApplicationRecord
    has_many :items  
    has_one  :card
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :nickname, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 7 }
  end