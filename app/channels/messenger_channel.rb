class MessengerChannel < ApplicationCable::Channel

  
  def subscribed
    convo = Conversation.find_by(id: params[:convoId])
    stream_for convo
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    raise NotImplementedError
  end
end
