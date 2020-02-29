class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation, touch: true

  def message_for_broadcast
    {
      id: self.id,
      content: self.content,
      user: self.user
    }
  end
end
