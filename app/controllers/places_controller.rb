class PlacesController < ApplicationController
	
	def create
		place_params = params[:place]
		@place = Place.new(place_params)
		@place.chain = Chain.find_or_create_by(name: place_params[:name])
		@place.save
		render 'places/show', :status => (@place.errors.present? ? 400 : 200)
	end
	
	def show
		@place = Place.find(params[:place])
	end
	
	def index
		@places = Place.all
	end

end
