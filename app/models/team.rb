class Team < ApplicationRecord
	has_many :team_photos, dependent: :destroy
	has_many :practices, dependent: :destroy
	belongs_to :organizer, class_name: :User
	accepts_attachments_for :team_photos, attachment: :photo
	geocoded_by :address
	before_validation :geocode

end
