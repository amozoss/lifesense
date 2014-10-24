App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition)->
    if Ember.isEmpty(@controllerFor('login').get('token'))
      @redirectToLogin(transition)

  redirectToLogin: (transition)->
    @controllerFor('login').set('attemptedTransition', transition)
    @transitionTo('login')

  actions:
    error: (error, transition) ->
      if (error.status is 401)
        @redirectToLogin(transition)
      else
        console.log(error)
        alert('Something went wrong')
  
