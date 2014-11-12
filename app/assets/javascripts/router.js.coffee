# For more information see: http://emberjs.com/guides/routing/
#
App.Router.reopen
  #location: 'auto' # gets ride of the hash
  #rootURL: '/'

App.Router.map ()->
  @route 'home', path: '/'
  @route 'help'
  @route 'login'
  @route 'signup'

  @resource 'graphs'

  @resource 'user', path: '', ->
			@resource 'transmitters', ->
				@route 'transmitter', path: "/:transmitter_id"
				@route 'new'
			@resource 'sensors', ->
				@route 'new'
				@route 'sensor', path: "/:sensor_id"
