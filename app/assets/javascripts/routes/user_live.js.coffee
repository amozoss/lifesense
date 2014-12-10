App.UserLiveRoute = App.AuthenticatedRoute.extend
  model: ->
    @modelFor('user').get('sensors')

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.getLeds()
    @controllerFor('user_live_sensors').set('model', model)

