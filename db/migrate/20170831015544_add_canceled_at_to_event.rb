class AddCanceledAtToEvent < ActiveRecord::Migration[5.1]
  def change
  add_column :events, :canceled_at, :datetime
  end
end
