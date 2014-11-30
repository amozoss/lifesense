App.SensorsController = Ember.ArrayController.extend
  sortProperties: ['name']

  height: (->
    if window.mobilecheck()
      return 200
    else 
      return 500
  )()

