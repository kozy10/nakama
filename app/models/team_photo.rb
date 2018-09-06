class TeamPhoto < ApplicationRecord
	belongs_to :team
	attachment :photo
end
