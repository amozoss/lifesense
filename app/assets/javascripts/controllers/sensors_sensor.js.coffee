App.SensorsSensorController = Ember.Controller.extend
  setupData: (->
    console.log("setupData")
    @get('model.records').then ((records)=>
      data = []
      for record in records.content
        data.push([record.get('time_stamp'), record.get('value')])
        @set('data', data)
    )
  )

  data: null

  # Possibly Keep and modify to delete and individual record
#  actions:
#    delete: ->
#      @get('model').destroyRecord().then =>
#        @transitionToRoute 'sensors'
