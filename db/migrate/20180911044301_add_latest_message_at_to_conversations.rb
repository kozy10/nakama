class AddLatestMessageAtToConversations < ActiveRecord::Migration[5.2]
  def change
  	add_column :conversations, :latest_message_at, :datetime
  end
end
