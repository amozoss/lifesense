App.UserLiveController = App.SocketController.extend
  needs: ['user_live_sensors']

  sensors: Ember.computed.alias('controllers.user_live_sensors.arrangedContent')


