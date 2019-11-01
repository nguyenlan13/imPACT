class IdentityHabit < ApplicationRecord
    validates :identity_id, presence: true
    validates :habit_id, presence: true
    validates_uniqueness_of :identity_id, :scope => :habit_id

    belongs_to :identity
    belongs_to :habit
    
end
