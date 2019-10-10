class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user

    private

    def logged_in?
        !!current_user
    end
    
    def current_user
        User.find_by(id: session[:user_id])
    end
end
