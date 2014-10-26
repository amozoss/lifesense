App.UserController = Ember.ObjectController.extend
  needs: ['login']

  isAdmin: (->
    user = @get('controllers.login.currentUser')
    return user.admin
  ).property('controllers.login.currentUser')
  
  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'users'
