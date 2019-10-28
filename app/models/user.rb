class User < ApplicationRecord
    has_many :items  
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :omniauthable, omniauth_providers: [:google, :facebook]
    has_many :cards
    has_one :profile
  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :nickname, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 7 }

    class << self
       def find_or_create_for_oauth(auth)
         find_or_create_by!(email: auth.info.email) do |user|
           user.provider = auth.provider
           user.uid = auth.uid
           user.name = auth.info.name
           user.email = auth.info.email
           password = Devise.friendly_token[0..5]
           logger.debug password
           user.password = password
         end
       end
   
       def new_with_session(params, session)
         if user_attributes = session['devise.user_attributes']
           new(user_attributes) { |user| user.attributes = params }
         else
           super
         end
       end
     end

  end