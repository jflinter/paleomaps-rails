class Paleomaps.Views.Map extends Backbone.View

	initialize: ->
		@map = new Paleomaps.Models.Map()

	setModel: (model) ->
		@model = model
		@model.on('change', @render, this)

	setCollection: (collection) ->
		@collection = collection
		@collection.on('change', @render, this)
		@collection.on('reset', @render, this)

	render: ->
		@map.setCollection(@collection)
		this
