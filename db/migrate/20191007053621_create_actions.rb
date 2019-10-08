class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.string :action_step
      t.string :location
      t.string :time

      t.timestamps
    end
  end
end
