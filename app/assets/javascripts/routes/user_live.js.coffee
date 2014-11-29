App.UserLiveRoute = App.AuthenticatedRoute.extend
  model: ->
    @modelFor('user').get('sensors')

