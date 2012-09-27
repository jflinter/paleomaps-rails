class HomeController < ApplicationController
	respond_to :html
	def index
		render 'layouts/application' and return
	end
end
