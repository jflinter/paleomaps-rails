class Paleomaps.Views.PlacesNew extends Backbone.View

	template: JST['places/new']

	events:
		'click #new-place-button' : 'createPlace'

	initialize: ->
		@mapView = @options.mapView

	render: ->
		$(@el).html(@template())
		input = @$('#places-autocomplete')[0]
		@autocomplete = new google.maps.places.Autocomplete(input, types: ['establishment'])
		@autocomplete.bindTo('bounds', @mapView.map.googleMap);
		this

	createPlace: ->
		place = @autocomplete.getPlace();
		@collection.create
			name: place.name
			street_address: place.formatted_address
			latitude: place.geometry.location.Xa
			longitude: place.geometry.location.Ya
