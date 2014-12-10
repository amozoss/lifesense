App.SensorsController = Ember.ArrayController.extend
  sortProperties: ['pin_number.transmitter.name', 'name']

  height: (->
    if window.mobilecheck()
      return 200
    else 
      return 700
  )()

