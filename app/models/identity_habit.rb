class IdentityHabit < ApplicationRecord
    belongs_to :identity
    belongs_to :habit
end
