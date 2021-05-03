class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:username])
            session[:user_id] = @user_id
            redirect_to user_products_path(@user)
        elsif @user
            @errors = ["Invalid Password"]
            render :new
        else
            @errors = ["Invalid Username"]
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to '/signup'
    end

end