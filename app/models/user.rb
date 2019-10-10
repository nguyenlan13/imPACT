class User < ApplicationRecord
  validates :username, uniqueness: true

  has_secure_password

  has_many :habits
  has_many :identities, through: :habits
  
  has_many :user_pacts
  has_many :pacts, through: :user_pacts

  has_many :comments, as: :commentable
end
