App.SignupController = Ember.Controller.extend
  needs: ['login']

  actions:
    createUser: ->
      data = @getProperties(
        'name',
        'email',
        'password',
        'password_confirmation'
      )
      user = @store.createRecord 'user', data

      user.save().then =>
        @setProperties
          name: null,
          email: null,
          password: null,
          password_confirmation: null

        loginController = @get('controllers.login')
        loginController.setProperties
          email: data.email,
          password: data.password

        loginController.send('login')


