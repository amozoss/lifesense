App.LoginController = Ember.Controller.extend
  init: ->
    @_super()
    if localStorage.token
      console.log("login setup")
      Ember.$.ajaxSetup
        headers: { 'Authorization': 'Token token=' + localStorage.token }

  reset: ->
    @setProperties({
      email: null,
      password: null,
      errorMessage: null,
    })

  resetToken: ->
    @set('token', null)

  token: localStorage.token

  tokenChanged: (->
    console.log("Token changed")
    localStorage.token = @get('token')
    Ember.$.ajaxSetup
      headers: { 'Authorization': 'Token token=' + @get('token') }
  ).observes('token')


  actions:
    login: -> 
      self = @
      data = @getProperties('email', 'password')

      self.set('errorMessage', null)

      Ember.$.post('/api/login', data).then((response)->
        console.log(response)
        self.set('token', response.user.token)
        Ember.$.ajaxSetup
          headers: { 'Authorization': 'Token token=' + response.user.token }
        self.set('errorMessage', null)
        attemptedTransition = self.get('attemptedTransition')

        if (attemptedTransition) 
          console.log("redirecting")
          console.log(attemptedTransition)
          self.transitionToRoute(attemptedTransition.targetName)
          self.set('attemptedTransition', null)
        else
          self.transitionToRoute('users')
      , (value) -> 
        self.set('errorMessage', value.responseText)
      )








