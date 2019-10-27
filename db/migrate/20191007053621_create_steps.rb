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
        t.boolean :monday, default: true
        t.boolean :tuesday, default: true
        t.boolean :wednesday, default: true
        t.boolean :thursday, default: true
        t.boolean :friday, default: true
        t.boolean :saturday, default: true
        t.boolean :sunday, default: true
        t.integer :duration_number
        t.string :duration_type
        t.timestamps
    end
  end
end
