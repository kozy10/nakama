class AddReplyDeadlineToPractices < ActiveRecord::Migration[5.2]
  def change
  	add_column :practices, :reply_deadline, :time
  end
end
