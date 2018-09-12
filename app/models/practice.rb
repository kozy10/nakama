class Practice < ApplicationRecord
	belongs_to :team

	
	scope :future_practices, -> { where("date > ?", Time.now) }
	scope :older, -> { order(date: :asc)}
	scope :next_practice, -> { future_practices.older.limit(1)}
end
