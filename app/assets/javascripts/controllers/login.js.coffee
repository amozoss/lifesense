App.LoginController = Ember.Controller.extend
  init: ->
    @_super()
    if Ember.$.cookie('access_token')
      Ember.$.ajaxSetup
        headers: { 'Authorization': 'Token token=' + Ember.$.cookie('access_token') }

  reset: ->
    @setProperties({
      email: null,
      password: null,
      errorMessage: null,
    })

  attemptedTransition: null 

  resetToken: ->
    @set('token', null)
    @set('currentUser', null)
    Ember.$.ajaxSetup
      headers: { 'Authorization': 'Token token=' }

  token: Ember.$.cookie('access_token')
  currentUser: Ember.$.cookie('auth_user')

  tokenChanged: (->
    if Ember.isEmpty(@get('token'))
      Ember.$.removeCookie('access_token')
      Ember.$.removeCookie('auth_user')
    else
      Ember.$.cookie('access_token', @get('token'))
      Ember.$.cookie('auth_user', @get('currentUser'))
  ).observes('token', 'currentUser')


  actions:
    login: -> 
      self = @
      data = @getProperties('email', 'password')

      self.set('errorMessage', null)

      Ember.$.post('/api/login', data).then((response)->
        Ember.$.ajaxSetup
          headers: { 'Authorization': 'Token token=' + response.user.token }
        console.log(response)
        self.set('token', response.user.token)
        # only save important stuff
        self.set('currentUser', 
          {
            admin: response.user.admin,
            id: response.user.id
          })
        self.set('errorMessage', null)
        attemptedTransition = self.get('attemptedTransition')

        if (attemptedTransition) 
          self.transitionToRoute(attemptedTransition.targetName)
          self.set('attemptedTransition', null)
        else
          self.transitionToRoute('user.transmitters')

      , (value) -> 
        self.set('errorMessage', value.responseText)
      )








