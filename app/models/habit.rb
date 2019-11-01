class Habit < ApplicationRecord
    # validates :build, presence: true
    validates :title, presence: true
    validates :frequency_number, presence: true, numericality: true
    validates :frequency, presence: true
    
    
    
    has_many :streaks, dependent: :destroy
    has_many :steps, dependent: :destroy
    has_many :identity_habits, dependent: :destroy
    has_many :identities, through: :identity_habits
    has_many :users, through: :identities
    has_many :comments, as: :commentable, dependent: :destroy

    #scope method

    def self.building
        where(build: true).order(created_at: :desc).limit(5)
    end

    def self.quit
        where(build: false).order(created_at: :desc).limit(5)
    end

end

