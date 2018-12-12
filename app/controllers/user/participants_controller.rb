class User::ParticipantsController < User::UserBase
	before_action :authenticate_user!

	def index
		@practices = Practice.joins(:participants).where(participants: {user_id: current_user.id}).order("start_time ASC")
		@practices.each do |practice|
			@participants_number = Participant.where(practice_id: practice.id).count
		end
	end

	def create
		@participant = current_user.participants.where(practice_id: params[:practice_id]).first
		if @participant
			@participant.destroy!
		else
			@participant = current_user.participants.create(practice_id: params[:practice_id])
		end
		redirect_to user_team_path(params[:team_id])
	end
end