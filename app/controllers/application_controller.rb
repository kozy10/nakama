class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_sports
  include ApplicationHelper

	def set_sports
		@sports = Sport.all
	end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end




	# before_action :set_search

	# private
 #  def set_search
	#   @search_form = TeamSearchForm.new(search_params)
	# end
	
	# def search_params
 #    	return  nil if params[:search].nil?
 #    	params.require(:search).permit(:sport_id, :address, :lat, :lng )
 #  end

