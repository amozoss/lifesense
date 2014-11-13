App.SensorsSensorController = Ember.Controller.extend

  name: "dynamic name",

  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'sensors'
