class User::PracticesController < User::UserBase

	def index
	end

	def new
		@practice = Practice.new
	end

	def create
		@team = Team.find(params[:team_id])
		@practice = @team.practices.build(practice_params)
		@practice.save!
		redirect_to user_manage_path(@team)
	end

	def show
	end

	private
  def practice_params
    params.require(:practice).permit(:team, :title, :date, :start_time, :end_time, 
    	:reply_deadline, :location, :limited_participants, :description)
  end

  def set_team
  	@team = Team.find(params[:id])
  end
end