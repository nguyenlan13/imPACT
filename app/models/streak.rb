class Streak < ApplicationRecord
  belongs_to :habit
  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reactions, as: :reactable, dependent: :destroy


# def less_than_a_day(habit1, habit2)
#     counter = 0
#     if (habit1.created_at - habit2.created_at)  < (idk how to get 24 hours with Time)
#         counter += 1
#     end
# end


end
