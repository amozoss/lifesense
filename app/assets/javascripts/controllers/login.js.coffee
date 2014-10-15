
App.LoginController = Ember.Controller.extend
  reset: ->
    @setProperties({
      email: "",
      password: "",
      errorMessage: ""
    })

  actions:
    login: -> 
      self = @
      data = @getProperties('email', 'password')

      self.set('errorMessage', null)

      Ember.$.post('/api/login', data).then((response)->
        console.log(response)
        App.set('token', response.user.token)
        self.set('errorMessage', null)
        self.transitionToRoute('users')
      , (value) -> 
        self.set('errorMessage', value.responseText)
      )








