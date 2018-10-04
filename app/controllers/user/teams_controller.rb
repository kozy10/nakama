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
    @teams = @teams.where(sport_id: params[:sport_id]) if params[:sport_id].present?
    @teams = @teams.limit(6)
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
		redirect_to user_manage_team_basics_path(@team), notice: "チームを作成しました"
	end

	def show
		@team = Team.find(params[:id])
		@organizer = User.find(@team.organizer_id)
		@practice = Practice.next(@team)
		@participants_number = Participant.where(practice_id: @practice.id).count if @practice.present?
		@participant = current_user.participants.where(practice_id: @practice.id).first if @practice.present?
		@photos = Photo.where(team_id: @team.id) 
		@number_of_photos = Photo.where(team_id: @team.id).count

		geolocation = [@team.latitude,@team.longitude]

		# if Team.where(sport_id: @team.sport_id).near(geolocation, 3) != 0
		@teams = Team.where(sport_id: @team.sport_id).near(geolocation, 3, order: 'distance').limit(4)
		@arrteams = @teams.to_a
		@nearteams = @arrteams.from(1)
		
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

	def sports
		@sport = Sport.new
		respond_to do |format|
			format.js { render 'partial/sports'}
		end
	end

	private

	

  def team_params
    params.require(:team).permit(:name, :establishment_year, :address, :practice_day, :practice_time,
    	:number_of_members, :age_bracket, :homepage, :description, :latitude, :longitude, :organizer, :sport_id, :profile_image)
  end

  def set_team
    @team = Team.find(params[:id]) 
  end
end