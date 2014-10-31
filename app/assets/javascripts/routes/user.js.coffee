App.UserRoute = App.AuthenticatedRoute.extend
  model: (params) -> 
    console.log(params)
    user = Ember.$.cookie('auth_user')
    return @store.find('user', user.id)

  serialize: ()->
    user = Ember.$.cookie('auth_user')
    return {user_id:user.get('id')}
    
