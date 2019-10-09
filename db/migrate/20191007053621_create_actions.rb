class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.integer :habit_id
      t.string :action_step
      t.string :start_datetime
      t.string :location
      t.string :duration
      t.timestamps
    end
  end
end
