class AddColumnsToParticipant < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :canceled_at, :datetime
    add_column :participants, :comment, :string
    add_column :participants, :ticket_id, :bigint
    add_index :participants, :ticket_id
    add_foreign_key :participants, :tickets, column: :ticket_id
  end
end
