class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user

    private

    #add rescue 404
    #add rescue 403

    def owner?(resource)
        resource.user == current_user
    end

    # def authorize(resource)
    #     if !owner?(resource)
    # end


    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authenticate
        redirect_to login_path if !logged_in?
    end
end
