App.TransmittersNewController = Ember.Controller.extend
  needs: ['login']

  actions:
    createTransmitter: ->
      data = @getProperties(
        'name',
      )
      user = @get('controllers.login').get('currentUser')
      transmitter = @store.createRecord 'transmitter', 
        {
          name: data.name
        }

      self = @
      console.log("*****************8")
      console.log(user.id)
      @store.find('user', user.id).then (user)=>
        console.log(user)
        transmitter.set('user', user)
        console.log(transmitter.get('user'))
      console.log(transmitter)

      transmitter.save().then =>
        @setProperties
          name: null,
        self.transitionToRoute "transmitters.transmitter", transmitter
      #transmitter.commit


