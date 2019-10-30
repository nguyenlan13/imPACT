class IdentityHabit < ApplicationRecord
    belongs_to :identity
    belongs_to :habit
    validates_uniqueness_of :identity_id, :scope => :habit_id
end
