class UsersController < ApplicationController
    before_action :authorized, only: [:persist, :update, :destroy]


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
        if params[:avatar] == ''
            avatar = 'https://i5.walmartimages.com/asr/39f4edb4-f7a9-4caf-b562-b20f8d135999_1.a5f5873d9043274b8d3a87f8108339be.jpeg?odnWidth=450&odnHeight=450&odnBg=ffffff'
        else
            avatar = params[:avatar]
        end
        @user = User.create(username: params[:username], password: params[:password], email: params[:email], first_name: params[:first_name], last_name: params[:last_name], bio: params[:bio], avatar: avatar)
        
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
        # dynamic based on who's profile is being viewed
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
