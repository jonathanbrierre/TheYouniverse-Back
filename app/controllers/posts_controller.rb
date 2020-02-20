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

    def infinite_scroll
        topic = Topic.all.find_by(slug: params[:slug])
        @posts = posts_by_topic(topic).slice((8*params[:page].to_i) -8, second_argument )
        render json: @posts
    end

    private 

    def posts_by_topic(topic)
        @posts = Post.all.where(topic_id: topic.id).reverse
    end

    def second_argument
        if (8*params[:page].to_i) - 8 == 0
            second_argument = 8*params[:page].to_i
        elsif (8*params[:page].to_i) - 8 == 8
            second_argument = (8*params[:page].to_i) - 8
        elsif (8*params[:page].to_i) - 8 > 8
            second_argument = (8*params[:page].to_i) - ((8*params[:page].to_i) - 8 )
        end
    end
end
