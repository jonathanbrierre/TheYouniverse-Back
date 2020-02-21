class CommentsController < ApplicationController
    before_action :authorized, only: [:create]
    def create
        # byebug
        @comment = Comment.create(content: params[:content], post_id: params[:post_id], user: @user)
        if @comment.valid?
            render json: @comment
        else
            render json: {message: "Comment couldn't be posted"}
        end
    end

    def post_comments 
        # use params to get the id of a post
        # byebug
        @comments = Comment.all.where(post_id: params[:post_id])
        
            render json: @comments
        
    end

end
