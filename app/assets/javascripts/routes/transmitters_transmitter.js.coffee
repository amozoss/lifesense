App.TransmittersTransmitterRoute = App.AuthenticatedRoute.extend
  model: (params) ->
    @store.find('transmitter', params.transmitter_id)

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.getLeds()
