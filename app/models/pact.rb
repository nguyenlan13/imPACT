class Pact < ApplicationRecord
  has_many :user_pacts
  has_many :users, through: :user_pacts

end
