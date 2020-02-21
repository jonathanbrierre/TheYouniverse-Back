class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.order 
      Post.all.order(:created_at)
  end
end
