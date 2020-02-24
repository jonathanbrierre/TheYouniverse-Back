class User < ApplicationRecord
    has_secure_password
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :topics, through: :posts
    validates :username, uniqueness: true
    validates :email, uniqueness: true
end
