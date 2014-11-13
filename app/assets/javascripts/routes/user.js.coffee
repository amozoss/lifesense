App.UserRoute = App.AuthenticatedRoute.extend
  model: (params) ->
    user = Ember.$.cookie('auth_user')
    return @store.find('user', user.id)
