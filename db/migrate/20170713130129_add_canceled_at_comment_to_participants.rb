class AddCanceledAtCommentToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :canceled_at, :datetime
    add_column :participants, :comment, :string
  end
end
