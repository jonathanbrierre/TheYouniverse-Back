class MessagesController < ApplicationController
  before_action :authorized, only: [:create]


  # POST /messages
  def create
    # byebug
    @message = Message.create(conversation_id: params[:convoId], user: @user, content: params[:content])
    convo = Conversation.find_by(id: params[:convoId])

    if @message.valid?
      # byebug
      MessengerChannel.broadcast_to(convo, @message.message_for_broadcast)
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end



  # DELETE /messages/1
  # def destroy
  #   @message.destroy
  # end

end
