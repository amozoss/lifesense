App.SensorsSensorController = Ember.Controller.extend
  needs: ['application']

  isChecked: true
  disabled: false
  theFormula: null
  data: null
  transmitters: null
  transmitter: null
  pinNumbers: null
  pinNumber: null
  record: null
  
  setupMobile: (->
    console.log(window.mobilecheck())
    @set('isMobile', window.mobilecheck())
  )

  # emberdata doesn't track dirt on relationships 
  isRelationDirty: false  

  isCheckedChanged: (->
    isChecked = @get('isChecked')
    console.log isChecked
  ).observes('isChecked')

  getTransmitters: ->
    userid = @get('controllers.application.currentUser').id
    @set('transmitter', null)

    @store.find('transmitter', { user_id: userid }).then (transmitters)=>
      @set('transmitters', transmitters)

    pin_number = @get("model.pin_number")
    if (!Ember.empty(pin_number) && !Ember.empty(pin_number.get('transmitter'))) 
      @set('transmitter', pin_number.get('transmitter'))

    @set('isRelationDirty', false) # still dirty since it was just set from the model

  getPinNumbers: ->
    transmitter = @get('transmitter')
    if (!Ember.empty(transmitter)) 
      @set('pinNumbers', transmitter.get('pin_numbers'))
      @set('pinNumber', @get('model.pin_number'))

  relationChange: (->
    @set('isRelationDirty', true)
    @getPinNumbers()
  ).observes('transmitter', 'pinNumber')

  setupData: (->
    formula = @get('model.formula')
    @get('model.records').then ((records)=>
      data = []
      for record in records.content
        value = record.get('value')

        scope = { x : value }
        calculated_value = null
        # apply the sensor formula
        try
          calculated_value = math.eval(formula, scope)
        catch
          calculated_value = value

        data.push([record.get('time_stamp'), calculated_value])
      @set('data', data)
    )
  ).observes('theFormula', 'record')

  showUnsavedMessage: ( ->
    !@get('model.isSaving') and (@get('model.isDirty') or @get('isRelationDirty'))
  ).property('model.isDirty', 'model.isSaving', 'isRelationDirty')

  red: false
  blue: false
  green: false
  # Possibly Keep and modify to delete and individual record
  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'sensors'

    saveChanges: ->
      if @get('model.isDirty') or @get('isRelationDirty')
        @get('model').save().then =>
          @set('isRelationDirty', false)
          @set('theFormula', @get('model.formula'))
    
    led: (pin, isChecked)->
      console.log(pin.get('name'))
      console.log(isChecked)

    ledGreen: ->
      @socket.emit 'led', { green: @get('green')}
      @set('green', !@get('green'))

    ledBlue: ->
      @socket.emit 'led', { blue: @get('blue')}
      @set('blue', !@get('blue'))




  sockets: 
    test: (data) ->
      data = data.record

      @store.find('sensor', data.sensor_id).then (sensor)=>
        record = {
          sensor: sensor
          time_stamp: (new Date).getTime()
          value: data.value
        }
        #@store.push('record', record)
        console.log(record)
        if @get('model').id == sensor.id
          @set('record', record)


      

    connect: ->
      console.log('Socket connected in sensors_sensor')

    disconnect: ->
      console.log('Socket disconnected')
        
