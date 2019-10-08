class CreateUserPacts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_pacts do |t|
      t.integer :user_id
      t.integer :pact_id

      t.timestamps
    end
  end
end
