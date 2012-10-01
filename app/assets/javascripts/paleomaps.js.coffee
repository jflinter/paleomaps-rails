window.Paleomaps =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
  	Paleomaps.router = new Paleomaps.Routers.Places()
  	Backbone.history.start(pushState: true)

$(document).ready ->
  Paleomaps.init()
