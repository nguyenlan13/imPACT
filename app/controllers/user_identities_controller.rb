class UserIdentitiesController < ApplicationController

    def create
        user_identity = UserIdentity.new(user: current_user, identity: Identity.find(params[:identity_id]))
        if user_identity.save
            redirect_to identity_path(params[:identity_id])
        else
            flash[:danger] = "You've already joined this PACT."
            redirect_to(request.env['HTTP_REFERER'])
        end
    end

    def destroy
        user_identity = UserIdentity.find(params[:id])
        user_identity.delete
        redirect_to(request.env['HTTP_REFERER'])
    end
end
