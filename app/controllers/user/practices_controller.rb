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

	def join
		# participantsにデータを挿入
		@participants = current_user.participants.create(practice_id: params[:practice_id])
		redirect_to user_team_path(params[:team_id])
	end

	private
  def practice_params
    params.require(:practice).permit(:team, :title, :date, :start_time, :end_time, 
    	:reply_deadline, :location, :limited_participants, :description)
  end

  def set_team
  	@team = Team.find(params[:id])
  end

  def participant_params
  	params.require(:participant).permit(:practice_id, :user_id)
  end
end