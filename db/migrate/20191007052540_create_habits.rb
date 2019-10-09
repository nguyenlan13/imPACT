class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.integer :user_id
      t.integer :identity_id
      t.string :title
      t.text :description
      t.string :frequency
      t.timestamps
    end
  end
end
