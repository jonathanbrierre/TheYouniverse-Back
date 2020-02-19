class UsersController < ApplicationController
    def index 
        @users = User.all 
        render json: @users
    end

    def show 
        @user = User.find_by(id: params[:id])
        render json: {user: UserSerializer.new(@user)}
    end
end
