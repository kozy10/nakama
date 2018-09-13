class ChangeDatatypeTimesOfPractices < ActiveRecord::Migration[5.2]
  def change
  	change_column :practices, :reply_deadline, :datetime
  end
end
