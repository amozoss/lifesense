App.SensorsController = Ember.ArrayController.extend
  sortProperties: ['name']

  name: 'Dan'
  age: 16
  height: (->
    if window.mobilecheck()
      return 200
    else 
      return 500
  )()


  sockets: 
    cherryPickedName: (name, age) ->
      @set('name', name)
      @set('age', age)

    connect: ->
      console.log('Socket connected in sensors')

    disconnect: ->
      console.log('Socket disconnected')

