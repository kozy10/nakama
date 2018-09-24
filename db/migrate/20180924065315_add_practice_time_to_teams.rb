class AddPracticeTimeToTeams < ActiveRecord::Migration[5.2]
  def change
  	remove_column :teams, :practice_start_time, :time
  	remove_column :teams, :practice_end_time, :time
  	add_column :teams, :practice_time, :string
  end
end
