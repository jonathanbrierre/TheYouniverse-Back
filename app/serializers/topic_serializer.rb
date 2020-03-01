class TopicSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :img
  # has_many :posts
end
