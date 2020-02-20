class PostsController < ApplicationController
    before_action :authorized, only: [:create]
    def index 
        @posts = Post.all 
        render json: @posts
    end

    def show 
        @post = Post.find_by(id: params[:id])
        render json: {post: PostSerializer.new(@post)}
    end

    def create 
        # byebug
        @post = Post.create(content: params[:content], topic_id: params[:topic_id], user: @user)
        render json: @post
    end
end
