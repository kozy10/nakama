class Admin::SportsController < Admin::AdminBase
	

	def index
		@sports = Sport.all
	end

	def new
		@sport = Sport.new 
	end

	def create
		@sport = Sport.new(sport_params)
		@sport.save
		redirect_to admin_sports_path
	end

	def edit 
		@sport = Sport.find(params[:id])
	end

	def update
	    @sport = Sport.find(params[:id])
	    @sport.update(sport_params)
	    redirect_to admin_sports_path
    end

	def destroy
	    @sport = Sport.find(params[:id])
	    @sport.destroy
	    flash[:success] = '削除が完了しました'
	    redirect_to admin_sports_path
	  end

	private

	def sport_params
		params.require(:sport).permit(:id, :name)
	end
end