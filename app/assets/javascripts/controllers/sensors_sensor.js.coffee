App.SensorsSensorController = Ember.Controller.extend
  needs: ['application']

  theFormula: null
  data: null
  transmitters: null
  transmitter: null
  pinNumbers: null
  pinNumber: null
  record: null

  isLED: Ember.computed.alias('model.led')
  
  # emberdata doesn't track dirt on relationships
  isRelationDirty: false

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
        value = record.get('y')

        scope = { x : value }
        calculated_value = null
        # apply the sensor formula
        try
          calculated_value = math.eval(formula, scope)
        catch
          calculated_value = value

        time = record.get 'x'
        data.push({x:time,y: calculated_value})

      @set('data', data)
#
    )
  ).observes('theFormula', 'record')

  showUnsavedMessage: ( ->
    !@get('model.isSaving') and (@get('model.isDirty') or @get('isRelationDirty'))
  ).property('model.isDirty', 'model.isSaving', 'isRelationDirty')

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
    
    led: (isChecked)->
      @set('model.led', isChecked)

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
