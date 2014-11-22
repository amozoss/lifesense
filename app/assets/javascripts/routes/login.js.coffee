App.LoginRoute = Ember.Route.extend
  beforeModel: (transition) ->
    if (!Ember.isEmpty(@controllerFor('login').get('token'))) 
      @transitionTo('sensors')

  setupController: (controller, context) ->
    controller.reset()

  actions: 
    error: (error, transition) ->
      if (error.status == 401)
        console.log("401!!!")
