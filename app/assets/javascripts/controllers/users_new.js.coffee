App.UsersNewController = Ember.Controller.extend

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
        @transitionToRoute 'user', user
