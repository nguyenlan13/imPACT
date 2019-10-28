class UserIdentity < ApplicationRecord
    belongs_to :user
    belongs_to :identity
    validates_uniqueness_of :user_id, :scope => :identity_id

end
