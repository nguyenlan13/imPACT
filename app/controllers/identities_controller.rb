class IdentitiesController < ApplicationController

    def index
        # if params[:user_id]
        #     @identities = User.find(params[:user_id]).identities
        # else
        #     @identities = Identity.all
        # end
        @identities = Identity.all
    end

    def new
        # @user = current_user
        # @identity = @user.identities.build
        @identity = Identity.new
    end

    def create
        # @identity = Identity.new(identity_params)
        # @identity.save
        # redirect_to identity_path(@identity)
        if params[:user_id]
            @user = User.find(id: params[:user_id])
            @identity = @user.identities.build(identity_params)
            if @identity.save!
                redirect_to user_path(@user)
            else 
               redirect_to new_identity_path
            end
        else
            @identity = Identity.new(identity_params)
            if @identity.save 
                redirect_to identity_path(@identity) 
            else
                redirect_to new_identity_path
            end
        end 
    end

    # def edit

    # end

    def show
        @identity = Identity.find(params[:id])
    end

    def identity_params
        params.require(:identity).permit(:title, :description, :user_id)
      end
end
