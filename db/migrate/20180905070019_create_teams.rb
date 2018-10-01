class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.string :name
    	t.integer :establishment_year
    	t.string :address
    	t.string :practice_day
    	t.time :practice_start_time
    	t.time :practice_end_time
    	t.string :number_of_members
    	t.string :age_bracket
    	t.string :homepage
    	t.text :description
    	t.float :latitude
    	t.float :longitude
    	t.integer :organizer_id
      t.timestamps
    end
  end
end
