class Team < ApplicationRecord
	has_many :photos
	has_many :practices, dependent: :destroy
	belongs_to :organizer, class_name: :User
	belongs_to :sport, optional: true

	geocoded_by :address
	before_validation :geocode


end
