App.TransmittersTransmitterController = Ember.Controller.extend

  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'transmitters'
