class User::ManagesController < User::UserBase
	
	def index
		@teams = Team.where(organizer_id: current_user.id)
	end

	def show
		@team = Team.find(params[:id])
		@practice = Practice.next(@team)
		@conversations = Conversation.involving(current_user)
	end

	def update
    @team.update(team_params)
    redirect_back(fallback_location: root_path)
  end

	def address
	end

	def photo
		@photo = TeamPhoto.new
	end

	private
  def team_params
    params.require(:team).permit(:name, :establishment_year, :address, :practice_day, :practice_start_time, :practice_end_time,
    	:number_of_members, :age_bracket, :homepage, :description, :latitude, :longitude, :organizer, :sports_name)
  end

  def set_team
    @team = Team.find(params[:id]) 
  end
end