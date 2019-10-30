class IdentitiesController < ApplicationController

    before_action :authenticate
        # before_action :authorize[]

    def index
        # if params[:user_id]
        #     @identities = User.find(params[:user_id]).identities
        # else
        #     @identities = Identity.all
        # end
        @identities = Identity.all
    end

    def new
        @user = current_user
        @identity = @user.identities.build
        # @identity = Identity.new
    end

    def create
        if params[:user_id]
            @user = User.find(id: params[:user_id])
            @identity = @user.identities.build(identity_params)
            if @identity.save
                redirect_to user_identities_path(@user)
            else 
                render :new
            end
        else
            @identity = Identity.new(identity_params)
            if @identity.save 
                redirect_to identities_path
            else
                render :new
            end
        end 
    end

    # def edit

    # end

    def show
        @user = current_user
        @identity = Identity.find(params[:id])
        @commentable = @identity
    end

    def identity_params
        params.require(:identity).permit(:pact_name, :description)
    end
end
