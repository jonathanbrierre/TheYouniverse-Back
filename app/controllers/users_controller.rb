class UsersController < ApplicationController
    before_action :authorized, only: [:persist, :show, :index, :update, :destroy]


    def update 
        # byebug
        @user.update(user_params)
        if @user.valid? 
            render json: @user 
        else
            render json: {message: @user.errors.full_messages}
        end
    end

    def create 
        # byebug
        @user = User.create(user_params)
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json:{ user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else 
            render  json: {message: @user.errors.full_messages}
        end
    end

    def destroy 
        @user.destroy
        render json: {message: 'successful deletion'}
    end

    def profile 
        # byebug
        @user = User.find_by(id: params[:id])
        if @user
            render json: @user
        else
            render json:  {message: 'Could not find user'}
        end
    end

    def login
        # byebug
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

    private 

    def user_params 
        params.permit(:username, :email, :first_name, :last_name, :bio, :password, :avatar)
    end
end
