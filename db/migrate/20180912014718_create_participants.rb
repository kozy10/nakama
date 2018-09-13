class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
    	t.integer :practice_id
    	t.integer :user_id

      t.timestamps
    end
  end
end
