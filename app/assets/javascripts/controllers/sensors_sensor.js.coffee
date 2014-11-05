App.SensorsSensorController = Ember.Controller.extend

  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'sensors'
