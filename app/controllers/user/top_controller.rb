class User::TopController < ApplicationController
	layout 'user'
	def index
		geolocation = [35.6594709, 139.7004051]
		@teams = Team.near(geolocation, 3, order: 'distance').limit(4)
		render 'user/top'
	end

	def test
		render 'user/test'
	end
end