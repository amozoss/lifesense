App.ApplicationController = Ember.Controller.extend
  needs: ['login'],

  isAuthenticated: (->
    console.log("isAuth")
    !Ember.isEmpty(@get('controllers.login.token'))
  ).property('controllers.login.token')

  currentUser: (->
    @get('controllers.login.currentUser').user
  ).property('controllers.login.currentUser')


