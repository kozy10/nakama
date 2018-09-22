class AddProfileImageIdToTeams < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :profile_image_id, :text
  end
end
