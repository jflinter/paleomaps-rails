class Paleomaps.Views.PlacesIndex extends Backbone.View

  template: JST['places/index']

  initialize: ->
  	@collection.on('reset', @render, this)

  render: ->
  	$(@el).html(@template(places: @collection))
  	this