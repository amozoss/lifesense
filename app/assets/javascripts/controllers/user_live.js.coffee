App.UserLiveController = App.SocketController.extend
  needs: ['user_live_transmitters']

  transmitters: Ember.computed.alias('controllers.user_live_transmitters')

  actions:
    recordValue: (pinName, transToken) ->
      console.log('recordValue in socket')
      @socket.emit('record_value', { transmitter_token: transToken, pin_name: pinName})

    redirectToHistory: (sensor) ->
      @transitionToRoute('user.sensors.sensor', sensor)


