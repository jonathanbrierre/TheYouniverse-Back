class TopicsController < ApplicationController
    def index 
        @topics = Topic.all 
        render json: @topics
    end

    def show 
        @topic = Topic.find_by(id: params[:id])
        render json: {topic: TopicSerializer.new(@topic)}
    end
    
end
