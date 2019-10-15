class CreateIdentityHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :identity_habits do |t|
        t.integer :identity_id
        t.integer :habit_id
        t.timestamps
    end
  end
end
