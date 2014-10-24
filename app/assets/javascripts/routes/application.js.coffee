App.ApplicationRoute = Ember.Route.extend
  actions:
    logout: ()->
      @controllerFor('login').resetToken()
      @transitionTo('login')
