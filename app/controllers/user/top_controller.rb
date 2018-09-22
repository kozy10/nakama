class User::TopController < ApplicationController
	layout 'user'
	def index

		render 'user/top'
	end
end