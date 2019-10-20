class UserIdentitiesController < ApplicationController

    def create
        user_identity = UserIdentity.create(user: current_user, identity: Identity.find(params[:identity_id]))
        if user_identity.save
            redirect_to user_identities_path(current_user)
        else
            flash[:danger] = "Identity was not saved, please try again"
            redirect_to identity_path(params[:identity_id])
        end
    end

end
