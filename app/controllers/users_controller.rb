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
            redirect_to products_path
        else
            @errors = @user.errors.full_messages
            render :new
        end
    end

    def show
    end

    private

        def user_params
            params.require(:user).permit(:username, :password, :password_confirmation)
        end

end
