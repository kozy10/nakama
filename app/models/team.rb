class Team < ApplicationRecord
	has_many :photos
	has_many :practices, dependent: :destroy
	has_many :favorites
	belongs_to :organizer, class_name: :User
	belongs_to :sport, optional: true
	attachment :profile_image
	geocoded_by :address
	after_validation :geocode

	is_impressionable


end
