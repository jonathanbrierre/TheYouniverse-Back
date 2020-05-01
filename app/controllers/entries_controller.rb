class EntriesController < ApplicationController
    before_action :authorized, only: [:create, :update, :destroy, :user_entries]

    def create 
        byebug
    end

    def update 
        byebug
    end 

    def destroy 
        byebug
    end

    def user_entries 
        byebug
    end
end
