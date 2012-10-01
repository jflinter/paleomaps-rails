class HomeController < ApplicationController
	respond_to :html
	def index
		request = ActionDispatch::Request.new('REMOTE_ADDR' => '76.173.29.77')
		  @location = request.location
		  if @location.present?
			  @latitude = @location.latitude
			  @longitude = @location.longitude
			end
		render 'layouts/application' and return
	end
end
