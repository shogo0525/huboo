class AddKickedOutAtToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :kicked_out_at, :datetime
  end
end
