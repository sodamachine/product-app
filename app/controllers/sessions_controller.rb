class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate
            session[:user_id] = @user_id
            redirect_to user_products_path(@user)
        else
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to '/signup'
    end

end