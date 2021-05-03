class ApplicationController < ActionController::Base

    helper method(:current_user)

    def current_user
        @current_user = User.first
    end
    
end
