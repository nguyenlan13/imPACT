class User < ApplicationRecord
  validates :username, uniqueness: true

  has_secure_password

  has_many :user_identities
  has_many :identities, through: :user_identities
  has_many :habits, through: :identities
  has_many :actions
#   has_many :comments, as: :commentable

#   accepts_nested_attributes_for :identities

#   def identities_attributes=(identity_attributes)
#     identity_attributes.values.each do |identity_attribute|
#         identity = Identity.find_or_create_by(identity_attribute)
#         self.identities << identity
#     end
#   end
end
