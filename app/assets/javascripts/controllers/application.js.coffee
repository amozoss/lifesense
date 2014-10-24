App.ApplicationController = Ember.Controller.extend
  needs: ['login'],

  isAuthenicated: (->
    console.log(@get('controllers.login.token'))
    console.log(Ember.isEmpty(@get('controllers.login.token')))
    isNull = @get('controllers.login.token') == undefined
    console.log("Hello " + isNull)
    not Ember.isEmpty(@get('controllers.login.token'))
    #@get('controllers.login.token') is not null
  ).property('controllers.login.token')


