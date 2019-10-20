module UsersHelper

    def add_identity
        if params[:identities]
            identity.each do |k,v|
            @user.identities << Identity.find(k)
            end
         end
    end
end
