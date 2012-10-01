class Paleomaps.Views.PlacesIndex extends Backbone.View

	template: JST['places/index']

	events:
		'click #new_place_button' : 'showNewPlace'

	initialize: ->
		@collection.on('reset', @render, this)

	render: ->
		$(@el).html(@template())
		@collection.each(@appendPlace)
		this

	showNewPlace: (event) ->
		event.preventDefault()
		Paleomaps.router.navigate("places/new", trigger: true)

	appendPlace: (place) =>
		view = new Paleomaps.Views.Place(model: place)
		@$('#places').append(view.render().el)
