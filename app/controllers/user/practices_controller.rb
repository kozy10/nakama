class User::PracticesController < User::UserBase

	def index
		@team = Team.find(params[:team_id])
		@practices = Practice.where(team_id: params[:team_id]).order("start_time DESC")
		@practices.each do |practice|
			@participants_number = Participant.where(practice_id: practice.id).count
		end
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

	def edit
		@practice = Practice.find(params[:id])
	end

	def update
		@practice = Practice.find(params[:id])
		@practice.update(practice_params)
		redirect_to user_manage_path(params[:team_id])
	end

	def join
		# participantsにデータを挿入
		@participants = current_user.participants.create(practice_id: params[:practice_id])
		redirect_to user_team_path(params[:team_id])
	end

	def participants
		@participants = Participant.where(practice_id: params[:practice_id])
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