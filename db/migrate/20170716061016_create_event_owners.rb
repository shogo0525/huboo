class CreateEventOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :event_owners do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps
    end
    add_index :event_owners, [:user_id, :event_id], unique: true
  end
end
