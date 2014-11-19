App.SensorsSensorController = Ember.Controller.extend
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
  ).observes('theFormula')

  showUnsavedMessage: ( ->
    @get('model.isDirty') and !@get('model.isSaving')
  ).property('model.isDirty', 'model.isSaving')

  getElement: (array) ->
    console.log("array: " + array)
    array[0]

  theFormula: null
  data: null

  # Possibly Keep and modify to delete and individual record
  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'sensors'

    saveChanges: ->
      if @get('model.isDirty')
        @get('model').save().then =>
          console.log("saved")
          @set('theFormula', @get('model.formula'))

  name: 'Dan'
  age: 16

  sockets: 
    cherryPickedName: (name, age) ->
      @set('name', name)
      @set('age', age)

    connect: ->
      console.log('Socket connected in sensors_sensor')

    disconnect: ->
      console.log('Socket disconnected')
        
