App.UserTransmittersRoute = App.AuthenticatedRoute.extend
  model: ->
    @modelFor('user').get('transmitters')

