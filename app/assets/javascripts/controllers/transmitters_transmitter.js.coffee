App.TransmittersTransmitterController = Ember.Controller.extend
  leds: null
  showUnsavedMessage: ( ->
    @get('model.isDirty') and !@get('model.isSaving')
  ).property('model.isDirty', 'model.isSaving')

  getLeds: ->
    transmitterToken = @get('model.transmitter_token')
    console.log "getLEDS"
    @socket.emit('get_leds', { transmitter_token: transmitterToken })

  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'transmitters'

    led: (isOn, pinName, transToken) ->
      @socket.emit('led', { transmitter_token: transToken, pin_name: pinName, value: isOn})

    saveChanges: ->
      @get('model').save() if @get('model.isDirty')

  sockets: 
    led: (data) ->
      @set('sensorData', data)

    leds: (data) ->
      console.log(data)
      if data.leds and data.transmitter_token == @get('model.transmitter_token')
        @set('leds', data.leds)

    connect: ->
      console.log('Socket connected in sensors_sensor')

    disconnect: ->
      console.log('Socket disconnected')
