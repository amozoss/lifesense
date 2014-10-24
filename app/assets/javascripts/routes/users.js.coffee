App.UsersRoute = App.AuthenticatedRoute.extend
  model: -> @store.find 'user'

