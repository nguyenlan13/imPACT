class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            # session[:user_id] = @user.id
            log_in(@user)
            flash[:success] = "Welcome, #{@user.name}"
            redirect_to dashboard_path
        else
            flash[:danger] = "Login credentials were incorrect, please try again."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end

    def googleAuth

        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        @user = User.from_omniauth(access_token)
        # log_in(@user)
        # Access_token is used to authenticate request made from the rails application to the google server
        @user.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        @user.google_refresh_token = refresh_token if refresh_token.present?
       
        if @user.save
        #logs in the user
        # session[:user_id] = @user.id
            log_in(@user)
            flash[:success] = "Welcome #{@user.name}!"
            redirect_to dashboard_path
          
        else
            byebug
            flash[:danger] = "Login credentials were incorrect, please try again."
            redirect_to login_path
        end
        # user.save
        # redirect_to root_path
      end
end
