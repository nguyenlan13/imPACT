class CreateUserIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_identities do |t|
        t.integer :user_id
        t.integer :identity_id
        t.timestamps
    end
  end
end
