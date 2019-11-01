class Step < ApplicationRecord
  validates :user_id, presence: true
  validates :habit_id, presence: true
  validates :action_step, presence: true
  validates :start_datetime, presence: true
  validates :location, presence: true
  validates :action_time, presence: true
  validates :duration_number, presence: true
  validates :duration_type, presence: true


  belongs_to :user
  belongs_to :habit

  #scope method
end
