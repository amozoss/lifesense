App.UserLiveController = App.SocketController.extend
  needs: ['user_live_transmitters']

  transmitters: Ember.computed.alias('controllers.user_live_transmitters')


