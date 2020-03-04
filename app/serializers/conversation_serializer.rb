class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :updated
  has_one :user
  has_one :conversee
end
