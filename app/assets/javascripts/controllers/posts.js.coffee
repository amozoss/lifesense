App.PostsController = Ember.ArrayController.extend
  needs: ['application']

  sortProperties: ['update_at']

  isAdmin: Ember.computed.alias('controllers.application.isAdmin')
