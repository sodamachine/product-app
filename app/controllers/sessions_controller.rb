class SessionsController < ApplicationController

    def new
        @errors = []
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_products_path(@user)
        elsif @user
            @errors = ["Invalid Password"]
            render :new
        else
            @errors = ["Invalid Username"]
            render :new
        end
    end

    def create_fb
        @user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
            u.username = auth_hash['info']['email']
            u.password = SecureRandom.hex
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_products_path(@user)
        else
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        redirect_to '/signup'
    end

    private

        def auth_hash
            request.env['omniauth.auth']
        end

end