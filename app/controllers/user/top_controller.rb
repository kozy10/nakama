class User::TopController < ApplicationController
	layout 'user'
	def index
		geolocation = [35.8077379, 139.7241712]
		@teams = Team.near(geolocation, 3, order: 'distance').limit(4)
		render 'user/top'
	end
end