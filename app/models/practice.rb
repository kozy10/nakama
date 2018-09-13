class Practice < ApplicationRecord
	belongs_to :team
	has_many :participants

	def self.next team
		self.where(team_id: team.id).where("start_time > ?", Time.now).order("start_time ASC").first
	end

	
	# scope :future_practices, -> { where("date > ?", Time.now) }
	# scope :older, -> { order(date: :asc)}
	# scope :next_practice, -> { future_practices.older.limit(1)}
	
	# scope :next, ->(team) {
	# 	# where("team_id = ? and start_time > ?", team.id, Time.now).order("start_time ASC").first
	# 	where(team_id: team.id).where("start_time > ?", Time.now).order("start_time ASC").first
	# }
end
