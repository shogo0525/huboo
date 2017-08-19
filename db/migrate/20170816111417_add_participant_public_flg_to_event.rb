class AddParticipantPublicFlgToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :participant_public_flg, :boolean, null: false, default: true
  end
end
