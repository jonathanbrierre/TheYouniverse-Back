class ConversationsController < ApplicationController

  def create 
    # byebug

    # @convo = Conversation.find_or_create_by({user_id: params[:userId], conversee_id: params[:converseeId]} || {user_id: params[:converseeId], conversee_id: params[:userId]} )
    @convo = Conversation.find_by({user_id: params[:userId], conversee_id: params[:converseeId]})
    @convo2 = Conversation.find_by({user_id: params[:converseeId], conversee_id: params[:userId]})
    if @convo
      render json: @convo 
    elsif @convo2
      # byebug
      render json: @convo2 

    else
      @new_convo = Conversation.create(user_id: params[:userId], conversee_id: params[:converseeId])
      render json: @new_convo 
    end

  end

  def checked 
    # byebug
    convo = Conversation.find_by(id: params[:id])
    convo.update(updated: false)
    render json: {message: 'seen message'}
  end

  def user_convos
    # byebugc/
    @user = User.find_by(id: params[:userId])
    @convos = @user.conversations 
    @inverse_convos = @user.inverse_conversations
    all_convos = @convos + @inverse_convos
    render json: all_convos.sort_by{|convo| convo.updated_at}.reverse
  end

  def messages
    convo = Conversation.find_by(id: params[:convoId])
    @messages = convo.messages.order(:created_at)
    # byebug
    if convo.user_id == params[:userId]
      @conversee = convo.conversee
    elsif convo.conversee_id == params[:userId]
      @conversee = convo.user
    end
    render json:  @messages
  end

  def other_user
    # byebug
    convo = Conversation.find_by(id: params[:convoId])

    if convo.user_id == params[:userId].to_i
      @conversee = convo.conversee
    elsif convo.conversee_id == params[:userId].to_i
      @conversee = convo.user
    end
    
    render json: {first_name: @conversee.first_name, last_name: @conversee.last_name}
  end

end
