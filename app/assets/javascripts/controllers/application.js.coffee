App.ApplicationController = Ember.Controller.extend
  isAuthenicated: (->
    !Ember.isEmpty(App.get('token'))
  ).property('App.token')

  actions:
    logout: ()->
      App.set('token', null)
      @transitionToRoute('login')

