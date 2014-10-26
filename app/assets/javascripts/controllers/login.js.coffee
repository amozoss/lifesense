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
    Ember.$.ajaxSetup
      headers: { 'Authorization': 'Token token=' }

  token: Ember.$.cookie('access_token')

  tokenChanged: (->
    if Ember.isEmpty(@get('token'))
      Ember.$.removeCookie('access_token')
    else
      Ember.$.cookie('access_token', @get('token'))
  ).observes('token')


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
        self.set('errorMessage', null)
        attemptedTransition = self.get('attemptedTransition')

        if (attemptedTransition) 
          self.transitionToRoute(attemptedTransition.targetName)
          self.set('attemptedTransition', null)
        else
          self.transitionToRoute('users')

      , (value) -> 
        self.set('errorMessage', value.responseText)
      )








