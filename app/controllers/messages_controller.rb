class MessagesController < ApplicationController
  before_action :authorized, only: [:create]


  # POST /messages
  def create
    # byebug
    @message = Message.create(conversation_id: params[:convoId], user: @user, content: params[:content])

    if @message.valid?
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
