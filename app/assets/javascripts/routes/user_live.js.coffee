App.UserLiveRoute = App.AuthenticatedRoute.extend
  model: ->
    @modelFor('user').get('transmitters')

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.getLeds()
    @controllerFor('user_live_transmitters').set('model', model)

