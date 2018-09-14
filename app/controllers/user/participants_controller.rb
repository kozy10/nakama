class User::ParticipantsController < User::UserBase

	def index
		@practices = Practice.joins(:participants).where(participants: {user_id: current_user.id})
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