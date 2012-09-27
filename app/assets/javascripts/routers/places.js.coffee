class Paleomaps.Routers.Places extends Backbone.Router
	routes:
		'' : 'index'
		'places/:id' : 'show'

	initialize: ->
		@collection = new Paleomaps.Collections.Places()
		@collection.fetch()

	index: ->
		view = new Paleomaps.Views.PlacesIndex(collection: @collection)
		$('#place').html(view.render().el)

	show: (id) ->
		alert "place #{id}"