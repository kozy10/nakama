class User::PhotosController < User::UserBase

	def new
    @team = Team.find(params[:team_id])
		@photos = TeamPhoto.new
	end

  def edit
    @team = Team.find(params[:team_id])
    @photos = TeamPhoto.find_by(team_id: @team.id)
    if @photos.nil?
      redirect_to new_user_team_photo_path
    end
  end

  def update
  end
	
	def create
      @photos = TeamPhoto.new(photo_params)
      @photos.save
  end

  def list
    team = Team.find(params[:team_id])

    photos = []
    Photo.where(team_id: team.id).each do |photo|
        new_photo = {
            photo_id: photo.id,
        }
        photos.push(new_photo)
    end
  end

  private
  def photo_params
      params.require(:photo).permit(:image,:team_id)
  end
end