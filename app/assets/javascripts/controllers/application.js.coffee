App.ApplicationController = Ember.Controller.extend
  isAuthenicated: (->
    !Ember.isEmpty(App.get('token'))
  ).property('App.token')
