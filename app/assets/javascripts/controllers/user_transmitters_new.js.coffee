App.UserTransmittersNewController = Ember.Controller.extend
  needs: ['user']

  actions:
    createTransmitter: ->
      data = @getProperties(
        'name',
      )
      transmitter = @store.createRecord 'transmitter', data


      user = @get('controllers.user').get('model')
      self = @
      transmitter.save().then =>
        @setProperties
          name: null,
        user.get("transmitters").pushObject transmitter
        self.transitionToRoute "user.transmitters.transmitter", transmitter


