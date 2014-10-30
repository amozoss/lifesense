# For more information see: http://emberjs.com/guides/routing/
#
App.Router.reopen
  #location: 'auto' # gets ride of the hash
  #rootURL: '/'

App.Router.map ()->
  @resource 'user', path: '', ->
    @route 'transmitters', ->
      @route 'transmitter', path: "/:transmitter_id"
    @route 'sensors'

  @route 'home', path: '/'
  @route 'help'
  @route 'login'
  @route 'signup'

