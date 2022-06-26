class User < ApplicationRecord
    has_secure_password
    has_many :todos  #Corresponding association with todos table
    VALID_NAME_REGEX = /\A[^0-9`!@#\$%\^&*+_=]+\z/.freeze
    VALID_EMAIL_REGEX = /\A(.+)@(.+)$\z/.freeze
    validates :first_name, presence: true, length: { minimum: 3, maximum: 25 },format: { with: VALID_NAME_REGEX }
    validates :last_name, presence: true, length: { minimum: 3, maximum: 25 },format: { with: VALID_NAME_REGEX }
    validates :email, presence: true, length: { minimum: 10, maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6, maximum: 255 }
end
