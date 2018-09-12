class ChangeDatatypeStartTimeOfPractices < ActiveRecord::Migration[5.2]
  def change
  	change_column :practices, :start_time, :datetime
  end
end
