class CreateMainPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :main_photos, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.string :image_id
    	t.integer :team_id
      t.timestamps
    end
  end
end
