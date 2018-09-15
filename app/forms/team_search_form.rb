class TeamSearchForm
	include ActiveModel::Model

	attr_accessor :sport_id, :address, :lat, :lng

	def search(page)
    if lat.present? & lng.present? 
      @latitude = lat
      @longitude = lng
      geolocation = [@latitude,@longitude]
    else
      geolocation = Geocoder.coordinates(address)
      @latitude = geolocation[0]
      @longitude = geolocation[1]
    end
    teams = Team.all
    teams = Team.near(geolocation, 1, order: 'distance')
    arrteams = teams.to_a
    teams = arrteams.where(sport_id: sport_id) if sport_id.present?
  end
end