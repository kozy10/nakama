class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer :conversation_id
    	t.integer :user_id
    	t.text :body
      t.timestamps
    end
  end
end
