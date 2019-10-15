class Identity < ApplicationRecord
    has_many :user_identities
    has_many :users, through: :user_identities
    has_many :identity_habits
    has_many :habits, through: :identity_habits
    has_many :comments, as: :commentable


#   accepts_nested_attributes_for :habits

#   def habits_attributes=(habit_attributes)
#     habit_attributes.values.each do |habit_attribute|
#         habit = Habit.find_or_create_by(habit_attribute)
#         self.habits << habit
#     end
#   end
end
