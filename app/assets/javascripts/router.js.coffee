# For more information see: http://emberjs.com/guides/routing/
#
App.Router.reopen
  #location: 'auto' # gets ride of the hash
  #rootURL: '/'

App.Router.map ()->
  @route 'home'
  @route 'help'
  @route 'login'
  @route 'signup'

  @resource 'blog', ->
    @resource 'posts', ->
      @route 'post', path: "/:post_id", ->
        @route 'edit'
      @route 'new'

  @resource 'user', path: '/', ->
    @resource 'transmitters', ->
      @route 'transmitter', path: "/:transmitter_id"
      @route 'new'
    @resource 'sensors', ->
      @route 'new'
      @route 'sensor', path: "/:sensor_id"
    @route 'live'
