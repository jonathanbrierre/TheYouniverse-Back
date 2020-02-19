class PostSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :user
  has_one :topic
  has_many :comments
  has_many :likes
end
