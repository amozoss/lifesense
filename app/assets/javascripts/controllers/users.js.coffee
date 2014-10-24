App.UsersController = Ember.ArrayController.extend
  needs: ['login']

  sortProperties: ['name']
