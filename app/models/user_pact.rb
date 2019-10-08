class UserPact < ApplicationRecord
  belongs_to :pact
  belongs_to :user
end
