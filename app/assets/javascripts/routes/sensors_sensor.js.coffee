App.SensorsSensorRoute = App.AuthenticatedRoute.extend
  model: (params) ->
    @store.find('sensor', params.sensor_id)

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.getTransmitters()
    controller.getFrequencyPeriods()
    controller.setupData()

