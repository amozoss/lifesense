App.PostsNewRoute = Ember.Route.extend
  setupController: (controller, model)->
    @_super(controller, model)
    controller.setupTags()
