class UserIdentitiesController < ApplicationController

    def create
        # if UserIdentity.find(user: current_user, identity: Identity.find(params[:identity_id]))
        #     # already exists
        #     flash[:danger] = "You've already joined this PACT."
        #     redirect_to identity_path(params[:identity_id])
        #     return
        # end
        
        user_identity = UserIdentity.new(user: current_user, identity: Identity.find(params[:identity_id]))
        if user_identity.save
            redirect_to user_identities_path(current_user)
        else
            flash[:danger] = "Identity was not saved, please try again"
            redirect_to identity_path(params[:identity_id])
        end
    end

    def destroy
        
    end

end
