class User < ApplicationRecord
  has_secure_password

  has_many :habits
  has_many :identities, through: :habits
  
  has_many :user_pacts
  has_many :pacts, through: :user_pacts


end
