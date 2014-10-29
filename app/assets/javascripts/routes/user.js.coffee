App.UserRoute = App.AuthenticatedRoute.extend
  model: (params) -> 
    console.log(Ember.$.cookie('auth_user'))
    user = Ember.$.cookie('auth_user')
    return @store.find('user', user.id)
    
