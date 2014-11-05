App.SensorsNewController = Ember.Controller.extend
  needs: ['login']

  actions:
    createSensor: ->
      data = @getProperties(
        'name',
        'formula'
      )
      user = @get('controllers.login').get('currentUser')
      sensor = @store.createRecord 'sensor', data

      self = @
      @store.find('user', user.id).then (user)=>
        sensor.set('user', user)

      sensor.save().then =>
        @setProperties
          name: null,
        self.transitionToRoute "sensors.sensor", sensor
