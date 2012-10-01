class PlacesController < ApplicationController
	
	def create
		place_params = params
		@place = Place.new(place_params)
		@place.chain = Chain.find_or_create_by(name: place_params[:name])
		@place.save
		render 'places/show', :status => (@place.errors.present? ? 400 : 200)
	end
	
	def show
		@place = Place.find(params[:id])
	end
	
	def index
		sleep(1)
		@places = Place.all
	end

end
