App.UserLiveController = Ember.Controller.extend
  sensorData: null
  actions:
    led: (isOn, pinName, transToken) ->
      @socket.emit('led', { transmitter_token: transToken, pin_name: pinName, value: isOn})

  sockets: 
    live: (data) ->
      @set('sensorData', data)

      #console.log(data)
      #data = data.record

      #@store.find('sensor', data.sensor_id).then (sensor)=>
      #record = {
      #sensor: sensor
      #time_stamp: (new Date).getTime()
      #value: data.value
      #}
      #console.log(record)
      #if @get('model').id == sensor.id
      #@set('record', record)

    connect: ->
      console.log('Socket connected in sensors_sensor')

    disconnect: ->
      console.log('Socket disconnected')
        
