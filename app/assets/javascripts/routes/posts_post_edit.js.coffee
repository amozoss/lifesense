App.PostsPostEditRoute = Ember.Route.extend

  activate: ->
    console.log("activate")
    controller = @controllerFor('posts.post')
    controller.set 'isEditing', true

  deactivate: ->
    console.log("deactivate")
    controller = @controllerFor('posts.post')
    controller.set 'isEditing', false

