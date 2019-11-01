class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user
    helper_method :owner?
    helper_method :authorize_to_view
 

    rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
    rescue_from ActionController::RoutingError, :with => :rescue404
    rescue_from ActionController::InvalidAuthenticityToken, :with => :rescue403
    rescue_from Errors::AuthorizationError, with: :rescue403 

    private

    def rescue404
        render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
    end

    def rescue403
        render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end

    def owner?(resource)
        resource.user == current_user
    end

    def authorize(resource)
        raise Errors::AuthorizationError.new if !resource
        raise Errors::AuthorizationError.new if !owner?(resource)
    end

    def authorize_to_view(path)
        unless params[:user_id].to_i == current_user.id
        flash[:danger] = "You are not authorized to see this page."
        redirect_to path
        end
    end

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
