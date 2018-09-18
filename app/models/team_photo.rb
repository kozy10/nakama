class TeamPhoto < ApplicationRecord
	belongs_to :team
	attachment :image
end
