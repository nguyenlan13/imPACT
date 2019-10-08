class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
