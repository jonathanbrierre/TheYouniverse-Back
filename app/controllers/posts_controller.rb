class PostsController < ApplicationController
    before_action :authorized, only: [:create, :update, :destroy]

    def create 
        # byebug
        @post = Post.create(content: params[:content], topic_id: params[:topic_id], user: @user)
        render json: @post
    end
    
    def update 
        # byebug
        @post = Post.find_by(id: params[:id])
        # byebug
        @post.update(content: params[:content])
        render json: @post
    end

    def destroy
        # byebug
        @post = Post.find_by(id: params[:id])
        @post.destroy
        render json: {message: 'Successfully deleted post'}
    end


    def infinite_scroll
        topic = Topic.all.find_by(slug: params[:slug])
        @posts = posts_by_topic(topic).slice((8*params[:page].to_i) -8, 8)

        render json: @posts
    end

    private 

    def posts_by_topic(topic)
        @posts = Post.consistent_order.where(topic_id: topic.id).reverse
    end


end
