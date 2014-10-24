App.ApplicationController = Ember.Controller.extend
  needs: ['login'],

  isAuthenicated: (->
    !Ember.isEmpty(@get('controllers.login.token'))
  ).property('controllers.login.token')


