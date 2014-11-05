App.SensorsRoute = App.AuthenticatedRoute.extend
  model: ->
    @modelFor('user').get('sensors')
