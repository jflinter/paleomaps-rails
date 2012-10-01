class Paleomaps.Views.PlacesShow extends Backbone.View

	template: JST['places/show']

	initialize: ->
		@model.on('change', @render, this)

	render: ->
		$(@el).html(@template(place: @model))
		this