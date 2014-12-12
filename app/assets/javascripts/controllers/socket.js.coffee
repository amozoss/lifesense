App.SocketController = Ember.Controller.extend
  sensorData: null
  leds: null

  getLeds: ->
    @socket.emit('get_leds')

  actions:
    led: (isOn, pinName, transToken) ->
      @socket.emit('led', { transmitter_token: transToken, pin_name: pinName, value: isOn})


  sockets: 
    leds: (data) ->
      @set('leds', data)

    live: (data) ->
      @set('sensorData', data)

    connect: ->
      console.log('Socket connected in socket')

    disconnect: ->
      console.log('Socket disconnected')
        
