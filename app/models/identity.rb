class Identity < ApplicationRecord
  has_many :users, through: :habits
  has_many :habits
  
end
