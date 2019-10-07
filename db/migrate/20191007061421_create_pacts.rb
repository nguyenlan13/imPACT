class CreatePacts < ActiveRecord::Migration[6.0]
  def change
    create_table :pacts do |t|

      t.timestamps
    end
  end
end
