class Habit < ApplicationRecord
    has_many :streaks, dependent: :destroy
    has_many :actions, dependent: :destroy
    has_many :identity_habits, dependent: :destroy
    has_many :identities, through: :identity_habits
    has_many :users, through: :identities
    has_many :comments, as: :commentable, dependent: :destroy

    # accepts_nested_attributes_for :identities

    #scope method
end

