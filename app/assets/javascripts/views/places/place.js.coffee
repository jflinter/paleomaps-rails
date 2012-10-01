class Paleomaps.Views.Place extends Backbone.View

	template: JST['places/place']
	tagName: 'li'

	events:
		'click' : 'showPlace'

	initialize: ->
		@model.on('change', @render, this)

	render: ->
		$(@el).html(@template(place: @model))
		this

	showPlace: (event) ->
		event.preventDefault()
		Paleomaps.router.navigate("places/#{@model.get('id')}", trigger: true)