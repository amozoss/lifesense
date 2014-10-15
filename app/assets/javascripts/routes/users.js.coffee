App.UsersRoute = Ember.Route.extend
  model: -> @store.find 'user'

  actions:
    error: (error, transition) ->
      if (error.status is 401)
        @transitionTo('login')
        console.log("users 401")
