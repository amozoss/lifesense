App.SensorsController = Ember.ArrayController.extend
  sortProperties: ['name']

  name: 'Dan'
  age: 16

  sockets: 
    cherryPickedName: (name, age) ->
      @set('name', name)
      @set('age', age)

    connect: ->
      console.log('Socket connected in sensors')

    disconnect: ->
      console.log('Socket disconnected')

