class Pact < ApplicationRecord
  has_many :user_pacts
  has_many :users, through: :user_pacts

  has_many :comments, as: :commentable
  # has_many :reactions, as: :reactable
end
