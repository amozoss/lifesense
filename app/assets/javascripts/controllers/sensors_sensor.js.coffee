App.SensorsSensorController = Ember.Controller.extend
  needs: ['application']

  theFormula: null
  data: null
  transmitters: null

  # emberdata doesn't track dirt on relationships 
  isTransmitterDirty: false  

  getTransmitters: ->
    userid = @get('controllers.application.currentUser').id
    @set('isTransmitterDirty', false) # still dirty since it was just set from the model

    @store.find('transmitter', { user_id: userid }).then (transmitters)=>
      @set('transmitters', transmitters)

  transmitterChange: (->
      @set('isTransmitterDirty', true)
  ).observes('model.transmitter')

  setupData: (->
    console.log('setupData')
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
    !@get('model.isSaving') and (@get('model.isDirty') or @get('isTransmitterDirty'))
  ).property('model.isDirty', 'model.isSaving', 'isTransmitterDirty')

  # Possibly Keep and modify to delete and individual record
  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'sensors'

    saveChanges: ->
      if @get('model.isDirty') or @get('isTransmitterDirty')
        @get('model').save().then =>
          console.log("saved")
          @set('isTransmitterDirty', false)
          @set('theFormula', @get('model.formula'))

        
