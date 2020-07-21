class AddRecipientToChatRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :recipient_id, :integer
    add_index :chatrooms, :recipient_id
    add_column :chatrooms, :sender_id, :integer
    add_index :chatrooms, :sender_id
  end
end
