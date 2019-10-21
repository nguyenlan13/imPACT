class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
        t.boolean :build, default: true
        t.string :title
        t.integer :frequency_number
        t.string :frequency
        t.timestamps
    end
  end
end
