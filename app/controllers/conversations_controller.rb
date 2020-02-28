class ConversationsController < ApplicationController


  def user_convos
    # byebugc/
    @user = User.find_by(id: params[:userId])
    @convos = @user.conversations 
    @inverse_convos = @user.inverse_conversations
    
    #how to update this to set order? 
    all_convos = @convos + @inverse_convos
    render json: all_convos
  end

  def messages
    convo = Conversation.find_by(id: params[:convoId])
    @messages = convo.messages.order(:created_at)
    # byebug
    render json: @messages
  end


end
