class AddPlaceToTeams < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :place, :string
  end
end
