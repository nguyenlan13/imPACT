class UsersController < ApplicationController
    # before_action :authorize

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
        #logs in the user
        # session[:user_id] = @user.id
            log_in(@user)
            flash[:success] = "Welcome #{@user.name}!"
            redirect_to dashboard_path
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
  
    end

    def dashboard
        @user = current_user

        # @identity = Identity.find(params[:identity_id])
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :username, :password)
    end

end
