App.UserRoute = App.AuthenticatedRoute.extend
  model: (params) ->
    user = Ember.$.cookie('auth_user')
    if (user)
      return @store.find('user', user.id)

  beforeModel: (transition) ->
    if Ember.isEmpty(@controllerFor('login').get('token'))
      @transitionTo('home')
    else if (Ember.get(transition, 'targetName') == 'user.index')
      @transitionTo('sensors')


