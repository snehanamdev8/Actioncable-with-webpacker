class AddFieldsInRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :sender_id, :integer
    add_column :rooms, :receiver_id, :integer
  end
end
