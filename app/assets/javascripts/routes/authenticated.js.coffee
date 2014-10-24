App.AuthenticatedRoute = Ember.Route.extend
  actions:
    error: (error, transition) ->
      if (error.status is 401)
        loginController = @controllerFor('login')
        loginController.set('attemptedTransition', transition)
        console.log("401 on an authenicated route")
        @transitionTo('login')
      else
        console.log(error)
        alert('Something went wrong')
  
