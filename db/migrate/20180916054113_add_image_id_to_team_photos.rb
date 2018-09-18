class AddImageIdToTeamPhotos < ActiveRecord::Migration[5.2]
  def change
  	add_column :team_photos, :image_id, :string
  end
end
