App.UserLiveRoute = App.AuthenticatedRoute.extend
  model: ->
    @modelFor('user').get('sensors')

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.getLeds()

