App.PostsRoute = Ember.Route.extend
  model: ->
    @store.find('post')
