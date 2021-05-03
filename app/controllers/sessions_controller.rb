class SessionsController < ApplicationController

    def new
        @user = User.new
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

    def create_github
        user = User.find_or_create_by(username: auth_hash['info']['email']) do |u|
            u.password = 'github'
        end
        if user.save
            session[:user_id] = user.id
            redirect_to products_path
        else
            redirect_to signup_path
        end
    end

    def destroy
        session.clear
        redirect_to '/signup'
    end

    private

        def auth_hash
            self.request.env['omniauth.auth']
        end

end