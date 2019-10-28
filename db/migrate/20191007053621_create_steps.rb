class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
        t.integer :user_id
        t.integer :habit_id
        t.string :action_step
        t.boolean :before, default: true
        t.string :start_datetime
        t.string :location
        t.time :action_time
        t.boolean :monday, default: false
        t.boolean :tuesday, default: false
        t.boolean :wednesday, default: false
        t.boolean :thursday, default: false
        t.boolean :friday, default: false
        t.boolean :saturday, default: false
        t.boolean :sunday, default: false
        t.integer :duration_number
        t.string :duration_type
        t.timestamps
    end
  end
end
