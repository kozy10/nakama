class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer :sender_id
    	t.integer :recipient_id
      t.timestamps
    end
  end
end
