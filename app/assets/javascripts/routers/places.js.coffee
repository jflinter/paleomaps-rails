class Paleomaps.Routers.Places extends Backbone.Router
	routes:
		'places/new' : 'newPlace'
		'places/:id' : 'show'
		'' : 'index'

	initialize: ->
		@collection = new Paleomaps.Collections.Places()
		@mapView = new Paleomaps.Views.Map()
		@menu = $('#menu')

	index: ->
		@collection.fetch()
		view = new Paleomaps.Views.PlacesIndex(collection: @collection)
		@menu.html(view.render().el)
		@mapView.setCollection(@collection)

	newPlace: ->
		view = new Paleomaps.Views.PlacesNew
			mapView: @mapView
			collection: @collection
		@menu.html(view.render().el)

	show: (id) ->
		@model = @collection.get(id)
		unless @model?
			@model = new Paleomaps.Models.Place(id: id)
		@model.fetch()
		view = new Paleomaps.Views.PlacesShow(model: @model)
		@menu.html(view.render().el)