class User::PagesController < User::PageBase

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

    @teams = Team.near(geolocation, 1, order: 'distance')

    #リスティングデータを配列にしてまとめる 
    @arrteams = @teams.to_a
  end
end
