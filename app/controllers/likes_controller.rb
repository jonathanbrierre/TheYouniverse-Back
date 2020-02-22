class LikesController < ApplicationController
    before_action :authorized, only: [:create, :destroy]

    def create 
        # byebug
        @like = Like.create( post_id: params[:post_id], user: @user)
        if @like.valid? 
            render json: @like
        else
            render json: {message: 'Like Failed - Try Again'}
        end
    end

    def destroy
        # byebug
        @like = Like.find_by(id: params[:id])
        @like.destroy
        render json: {message: 'successful destruction'}
    end
end
