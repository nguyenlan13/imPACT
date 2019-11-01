class Identity < ApplicationRecord
    has_many :user_identities, dependent: :destroy
    has_many :users, through: :user_identities
    has_many :identity_habits, dependent: :destroy
    has_many :habits, through: :identity_habits
    has_many :comments, as: :commentable, dependent: :destroy

    validates :pact_name, uniqueness: true, presence: true
    validates :description, uniqueness: true, presence: true
#scope method
#   accepts_nested_attributes_for :habits

#   def habits_attributes=(habit_attributes)
#     habit_attributes.values.each do |habit_attribute|
#         habit = Habit.find_or_create_by(habit_attribute)
#         self.habits << habit
#     end
#   end
end
