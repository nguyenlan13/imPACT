class UsersController < ApplicationController
    before_action :authenticate, only: [:index, :show, :dashboard]
  
    def index
        if params[:identity_id]
            @users = Identity.find(params[:identity_id]).users
        else
            @users = User.all
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            flash[:success] = "Welcome #{@user.name}!"
            redirect_to dashboard_path
        else
            flash[:danger] = "Sorry, Account could not be created, please try again."
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def dashboard
        @user = current_user
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :username, :password)
    end

end
