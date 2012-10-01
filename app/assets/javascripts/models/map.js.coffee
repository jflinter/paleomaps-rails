class Paleomaps.Models.Map extends Backbone.Model

	initialize: ->
		@markers = []
		@displayedPlaces = []
		if google?
			mapDiv = $('#map-container')
			mapOptions =
				center: new google.maps.LatLng(mapDiv.data('latitude'), mapDiv.data('longitude'))
				mapTypeId: google.maps.MapTypeId.ROADMAP
				zoom: 12
			mapOptions
			@googleMap = new google.maps.Map(mapDiv[0], mapOptions)
		else
			@googleMap = {}

	addPlace: (place) =>
		if google?
			marker = new google.maps.Marker
				title: place.get('name')
				position: new google.maps.LatLng(place.get('latitude'), place.get('longitude'))
				animation: google.maps.Animation.DROP
			marker.setMap @googleMap
			@markers[place] = marker

	setCollection: (collection) =>
		#remove all elements that are displayed that aren't in the new list
		for displayedPlace in @displayedPlaces
			if !(displayedPlace in collection.models)
				@displayedPlaces.pop(displayedPlace)
				delete @markers[displayedPlace]
		#animate in any new elements that weren't displayed before
		for place in collection.models
			if !(place in @displayedPlaces)
				@addPlace place
				@displayedPlaces.push(place)