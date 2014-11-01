App.TransmittersNewController = Ember.Controller.extend
  needs: ['login']

  actions:
    createTransmitter: ->
      data = @getProperties(
        'name',
      )
      user = @get('controllers.login').get('currentUser')
      transmitter = @store.createRecord 'transmitter', data

      @store.find('user', user.id).then (user)=>
        transmitter.set('user', user)

      self = @
      transmitter.save().then =>
        @setProperties
          name: null,
        self.transitionToRoute "transmitters.transmitter", transmitter


