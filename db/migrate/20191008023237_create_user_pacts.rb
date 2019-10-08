class CreateUserPacts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_pacts do |t|

      t.timestamps
    end
  end
end
