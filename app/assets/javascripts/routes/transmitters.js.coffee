App.TransmittersRoute = App.AuthenticatedRoute.extend
  model: ->
    @modelFor('user').get('transmitters')

