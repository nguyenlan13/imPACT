class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
        t.integer :user_id
        t.integer :habit_id
        t.string :action_step
        t.string :start_datetime
        t.string :location
        t.time :action_time
        t.string :day
        t.integer :duration_number
        t.string :duration_type
        t.timestamps
    end
  end
end
