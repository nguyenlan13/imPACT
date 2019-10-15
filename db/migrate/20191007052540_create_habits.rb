class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
        t.string :title
        t.text :description
        t.string :frequency
        t.timestamps
    end
  end
end
