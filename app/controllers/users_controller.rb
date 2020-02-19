class UsersController < ApplicationController
    before_action :authorized, only: [:persist, :show, :index]
    def index 
        @users = User.all 
        render json: @users
    end

    def show 
        @user = User.find_by(id: params[:id])
        render json: {user: UserSerializer.new(@user)}
    end

    def create 
        @user = User.create(params.permit(:username, :password))
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json:{ user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else 
            render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end

    def persist 
        token = encode_token({user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    end

end
