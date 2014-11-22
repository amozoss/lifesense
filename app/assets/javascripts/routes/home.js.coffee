App.HomeRoute = Ember.Route.extend
  beforeModel: ->
    if (!Ember.isEmpty(@controllerFor('login').get('token'))) 
      @transitionTo('sensors')

