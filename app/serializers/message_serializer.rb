class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
  # has_one :user
  has_one :conversation
end
