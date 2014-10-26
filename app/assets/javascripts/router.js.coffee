# For more information see: http://emberjs.com/guides/routing/
#
App.Router.reopen
  #location: 'auto' # gets ride of the hash
  #rootURL: '/'

App.Router.map ()->
  @resource 'users', ->
    @route 'new'
    @resource 'user', path: '/:id'
      #@resource 'sensors', ->
      #  @resource '', path: '/:id', ->



  @route 'home', path: '/'
  @route 'help'
  @route 'login'
  @route 'signup'

