class User::PhotosController < User::UserBase

  def create
      @photo = Photo.new(photo_params)
      if @photo.save
          render json: { message: "success", photoId: @photo.id }, status: 200
      else
          render json: { error: @photo.errors.full_messages.join(", ") }, status: 400
      end
  end

  def destroy
      @photo = Photo.find(params[:id])
      if @photo.destroy
          render json: { message: "file deleted from server" }
      else
          render json: { message: @photo.errors.full_messages.join(", ") }
      end
  end

  def list
      team = Team.find(params[:team_id])

      photos = []
      Photo.where(team_id: team.id).each do |photo|
        new_photo = {
            id: photo.id,
            name: photo.image_file_name,
            size: photo.image_file_size,
            src: photo.image
        }
        photos.push(new_photo)
      end
      render json: { images: photos }
  end



  private
  def photo_params
      params.require(:photo).permit(:image,:team_id)
  end
end