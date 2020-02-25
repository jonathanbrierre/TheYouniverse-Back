class User < ApplicationRecord
    has_secure_password

    has_many :followings
    has_many :followees, through: :followings
    has_many :inverse_followings, :class_name => 'Following', :foreign_key => 'followee_id'
    has_many :followers, through: :inverse_followings, source: :user

    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :topics, through: :posts

    validates :username, uniqueness: true, presence: true
    # validates :username, presence: true
    validates :email, uniqueness: true, presence: true
    # validates :email
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :bio, presence: true
end
