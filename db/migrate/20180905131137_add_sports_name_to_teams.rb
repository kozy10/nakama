class AddSportsNameToTeams < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :sports_name, :string
  end
end
