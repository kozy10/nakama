class User::FavoritesController < User::UserBase
	before_action :authenticate_user!

	def index
		@teams = Team.joins(:favorites).where(favorites: {user_id: current_user.id})
	end

	def create
		@favorite = current_user.favorites.where(team_id: params[:team_id]).first
		if @favorite
			@favorite.destroy! 
			respond_to do |format|
				format.js { render :delete }
			end
		else
			@favorite = current_user.favorites.create(team_id: params[:team_id])
			respond_to do |format|
				format.js { render :new }
			end
		end
	end
end