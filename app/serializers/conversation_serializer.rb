class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :updated, :last_message
  has_one :user
  has_one :conversee

  def last_message
    # byebug
    self.object.messages.last
  end

end
