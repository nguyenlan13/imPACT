class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: {in: 8..20}

    has_many :user_identities, dependent: :destroy
    has_many :identities, through: :user_identities
    has_many :habits, through: :identities
    has_many :actions, dependent: :destroy


  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end
#   has_many :comments, as: :commentable

#   accepts_nested_attributes_for :identities

#   def identities_attributes=(identity_attributes)
#     identity_attributes.values.each do |identity_attribute|
#         identity = Identity.find_or_create_by(identity_attribute)
#         self.identities << identity
#     end
#   end
end
