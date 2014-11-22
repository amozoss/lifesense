App.TransmittersRoute = App.AuthenticatedRoute.extend
  model: ->
    @modelFor('user').get('transmitters')

  afterModel: (transmitters, transition) ->
    if (transmitters.get('length') >= 1) 
      @transitionTo('transmitters.transmitter', transmitters.get('firstObject'))

