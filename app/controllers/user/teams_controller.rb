class User::TeamsController < User::UserBase
	before_action :set_team, only: [:show, :update, :basics, :address, :photo]

	# def search
	# 	@teams = @seach_form.search(params[:page])
	# end


	def search
    if params["lat"].present? & params["lng"].present? 
      @latitude = params["lat"]
      @longitude = params["lng"]
      geolocation = [@latitude,@longitude]
    else
      geolocation = Geocoder.coordinates(params[:search])
      @latitude = geolocation[0]
      @longitude = geolocation[1]
    end
    @teams = Team.near(geolocation, 3, order: 'distance')
    @teams = Team.where(sport_id: params[:sport_id]) if params[:sport_id].present?
    @arrteams = @teams.to_a
  end

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
		impressionist(@team, nil, :unique => [:session_hash])
	end

	def update
    @team.update(team_params)
    redirect_back(fallback_location: root_path)
  end

  def basics
  	@photo = Photo.new
  end

	def address
	end

	def photo
		@photo = Photo.new
	end

	private

	

  def team_params
    params.require(:team).permit(:name, :establishment_year, :address, :practice_day, :practice_start_time, :practice_end_time,
    	:number_of_members, :age_bracket, :homepage, :description, :latitude, :longitude, :organizer, :sport_id, :profile_image)
  end

  def set_team
    @team = Team.find(params[:id]) 
  end
end