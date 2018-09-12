class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
    	t.integer :team_id
    	t.string :title
    	t.time :date
    	t.time :start_time
    	t.time :end_time
    	t.text :description
    	t.string :location
    	t.string :address
    	t.float :latitude
    	t.float :longitude
    	t.integer :limited_participants
      t.timestamps
    end
  end
end
