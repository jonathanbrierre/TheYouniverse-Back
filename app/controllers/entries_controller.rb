class EntriesController < ApplicationController
    before_action :authorized, only: [:create, :update, :destroy, :user_entries]

    def create 
        # byebug
        @entry = Entry.create(text: entry_params[:text], user: @user)
        if @entry.valid?
            render json: {entry: @entry, message: 'Successfully creeated an entry!'}
        else
            render json: {message: 'something went wrong, please try again'}
        end
    end

    def update 
        # byebug
        @entry = Entry.find_by(id: entry_params[:id])
        @entry.update(text: entry_params[:text])
        render json: {entry: @entry, message: 'Successful Update'}
    end 

    def destroy 
        @entry = Entry.find_by(id: entry_params[:id])
        @entry.destroy
        render json: {message: 'Successfully Deleted'}
    end

    def user_entries 
        @user_entries = @user.entries.reverse
        render json: {entries: @user_entries}
    end

    private

    def entry_params
        params.permit(:id, :text)
    end
end
