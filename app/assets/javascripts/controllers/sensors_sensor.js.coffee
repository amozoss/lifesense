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
          calculated_value = math.eval("formula", scope)
        catch
          calculated_value = value

        data.push([record.get('time_stamp'), calculated_value])
      @set('data', data)
    )
  )

  data: null


  # Possibly Keep and modify to delete and individual record
#  actions:
#    delete: ->
#      @get('model').destroyRecord().then =>
#        @transitionToRoute 'sensors'
