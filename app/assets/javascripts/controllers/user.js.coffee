App.UserController = Ember.ObjectController.extend
  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'users'
