class UsersController < ApplicationController

    before_action :require_login, except: [:new, :create]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_products_path(@user)
        else
            @errors = @user.errors.full_messages
            render :new
        end
    end

    def show
        redirect_to user_products_path(@user)
    end

    private

        def user_params
            params.require(:user).permit(:username, :password, :password_confirmation, :uid)
        end

end
