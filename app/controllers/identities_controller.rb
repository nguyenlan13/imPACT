class IdentitiesController < ApplicationController

    before_action :authenticate

    def index
        if params[:user_id]
            @identities = User.find(params[:user_id]).identities
        else
            @identities = Identity.all
        end
    end

    def new
        @identity = Identity.new
    end

    def create
        @identity = Identity.new(identity_params)
        if @identity.save 
            redirect_to identity_path(@identity)
        else
            flash[:danger] = "Identity was not saved, please try again."
            render :new
        end
    end

    def show
        @user = current_user
        @identity = Identity.find(params[:id])
        @commentable = @identity
    end

    private

    def identity_params
        params.require(:identity).permit(:pact_name, :description)
    end
end
