App.PostsPostEditRoute = Ember.Route.extend

  activate: ->
    controller = @controllerFor('posts.post')
    controller.set 'isEditing', true

  deactivate: ->
    controller = @controllerFor('posts.post')
    controller.set 'isEditing', false

