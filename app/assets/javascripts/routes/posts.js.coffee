App.PostsRoute = Ember.Route.extend
  model: ->
    @store.find('post')

  setupController: (controller, model)->
    @_super(controller, model)
    controller.setupTags()
