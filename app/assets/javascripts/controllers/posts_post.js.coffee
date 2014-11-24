App.PostsPostController = Ember.Controller.extend
  needs: ['application']

  isAdmin: Ember.computed.alias('controllers.application.isAdmin')

  isEditing: false

  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'posts'



