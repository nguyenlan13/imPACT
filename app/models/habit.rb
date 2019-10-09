class Habit < ApplicationRecord
  belongs_to :identity
  belongs_to :user
  has_many :actions
  has_many :streaks
end
