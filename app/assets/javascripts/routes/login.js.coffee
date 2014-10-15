App.LoginRoute = Ember.Route.extend
  actions: 
    error: (error, transition) ->
      if (error.status == 401)
        console.log("401!!!")

  setupController: (controller, context) ->
    controller.reset()
