# For more information see: http://emberjs.com/guides/routing/
#
App.Router.reopen
  #location: 'auto' # gets ride of the hash
  #rootURL: '/'

App.Router.map ()->
  @resource 'users', ->
    @resource 'user', path: '/:id'

  @resource 'sessions'

  @route 'home', path: '/'
  @route 'help'
  @route 'login'
  @route 'logout'

