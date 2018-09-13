class RemoveDateFromPractice < ActiveRecord::Migration[5.2]
  def change
  	remove_column :practices, :date, :time
  end
end
