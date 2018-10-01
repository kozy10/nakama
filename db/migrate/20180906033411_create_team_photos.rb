class CreateTeamPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :team_photos, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer :team_id
    	t.string :photo_id

      t.timestamps
    end
  end
end
