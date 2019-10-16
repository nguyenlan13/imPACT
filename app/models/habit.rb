class Habit < ApplicationRecord
    has_many :streaks
    has_many :actions
    has_many :identity_habits
    has_many :identities, through: :identity_habits
    has_many :users, through: :identities
end

