class Team < ApplicationRecord
	has_many :team_photos, dependent: :destroy
	accepts_attachments_for :team_photos, attachment: :photo
	geocoded_by :address
	before_validation :geocode
end
