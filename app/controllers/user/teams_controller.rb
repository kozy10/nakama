class User::TeamsController < User::UserBase
	before_action :set_team, only: [:show, :update, :basics, :address, :photo]
	def index
		@teams = Team.where(organizer_id: current_user.id)
	end

	def new
		@team = Team.new 
	end

	def create
		@team = Team.new(team_params)
		@team.organizer_id = current_user.id
		@team.save
		redirect_to user_manage_team_basics_path(@team)
	end

	def show
		@team = Team.find(params[:id])
		@organizer = User.find(@team.organizer_id)
		@practice = Practice.next(@team)
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
    	:number_of_members, :age_bracket, :homepage, :description, :latitude, :longitude, :organizer, :sport)
  end

  def set_team
    @team = Team.find(params[:id]) 
  end
end