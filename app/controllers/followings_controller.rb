class FollowingsController < ApplicationController
  before_action :authorized, only: [:create, :destroy]


  def create
    
    @following = Following.create(user_id: @user.id, followee_id: params[:followee_id])
    # byebug
    if @following.valid?
      render json: @following.followee, status: :created #exceptions? 
    else
      render json: @following.errors, status: :unprocessable_entity
    end
  end

  # DELETE /followings/1
  def destroy
    # byebug
    @following = Following.find_by(followee_id: params[:id], user_id: @user.id)
    @following.destroy
    render json: {message: 'Successful Unfollow'}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_following
    #   @following = Following.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    # def following_params
    #   params.require(:following).permit(:user_id, :followee_id)
    # end
end
