class TopicSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
  has_many :posts
end
