App.SensorsRoute = App.AuthenticatedRoute.extend
  model: ->
    @modelFor('user').get('sensors')

  #afterModel: (sensors, transition) ->
  #if (sensors.get('length') >= 1) 
  #@transitionTo('sensors.sensor', sensors.get('firstObject'))
  

