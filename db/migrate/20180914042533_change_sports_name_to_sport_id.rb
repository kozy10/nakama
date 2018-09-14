class ChangeSportsNameToSportId < ActiveRecord::Migration[5.2]
  def change
  	remove_column :teams, :sports_name, :string
  	add_column :teams, :sport_id, :integer
  end
end
