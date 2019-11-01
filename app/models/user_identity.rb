class UserIdentity < ApplicationRecord
    validates :user_id, presence: true
    validates :identity_id, presence: true
    validates_uniqueness_of :user_id, :scope => :identity_id
    belongs_to :user
    belongs_to :identity

 

end
