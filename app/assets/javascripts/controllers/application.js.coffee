App.ApplicationController = Ember.Controller.extend
  needs: ['login'],

  isAuthenticated: (->
    !Ember.isEmpty(@get('controllers.login.token'))
  ).property('controllers.login.token')

  currentUser: (->
    @get('controllers.login.currentUser')
  ).property('controllers.login.currentUser')

  isAdmin: (->
    user = @get('controllers.login.currentUser')
    if !Ember.empty(user)
      return user.admin
    else
      return false

  ).property('controllers.login.currentUser')


