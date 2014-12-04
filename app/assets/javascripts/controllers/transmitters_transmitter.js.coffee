App.TransmittersTransmitterController = App.SocketController.extend
  showUnsavedMessage: ( ->
    @get('model.isDirty') and !@get('model.isSaving')
  ).property('model.isDirty', 'model.isSaving')

  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'transmitters'

    saveChanges: ->
      @get('model').save() if @get('model.isDirty')

