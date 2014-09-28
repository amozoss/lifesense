
App.LoginController = Ember.Controller.extend
  actions:
    login: -> 
      data = @getProperties('email', 'password')
      console.log(data)
      Ember.$.post('/api/login', data).then((response)->
        console.log(response)
        alert(response.user.email))
