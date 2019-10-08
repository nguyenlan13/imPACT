class CreatePacts < ActiveRecord::Migration[6.0]
  def change
    create_table :pacts do |t|
      t.string :name

      t.timestamps
    end
  end
end
