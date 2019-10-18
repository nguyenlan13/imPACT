class Habit < ApplicationRecord
    has_many :streaks, dependent: :destroy
    has_many :actions, dependent: :destroy
    has_many :identity_habits, dependent: :destroy
    has_many :identities, through: :identity_habits
    has_many :users, through: :identities

    #scope method
end

