class Streak < ApplicationRecord
  belongs_to :habit

  has_many :comments, as: :commentable
  has_many :reactions, as: :reactable
end
