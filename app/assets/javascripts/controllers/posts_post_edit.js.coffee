App.PostsPostEditController = Ember.Controller.extend
  actions:
    saveChanges: ->
      @get('model').save().then =>
        @transitionToRoute 'posts.post', @get('model')

    cancel: ->
      @get('model').rollback()
      @transitionToRoute 'posts.post', @get('model')



