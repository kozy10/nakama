class Participant < ApplicationRecord
	belongs_to :practice
	belongs_to :user
end
