App.SensorsSensorController = Ember.Controller.extend

  data: (->
  [
    [Date.UTC(2012, 0, 1), 0],
    [Date.UTC(2012, 0, 2), 2],
    [Date.UTC(2012, 0, 3), 3],
    [Date.UTC(2012, 0, 4), 2.15],
    [Date.UTC(2012, 0, 5), 2.45],
    [Date.UTC(2012, 0, 6), 6],
    [Date.UTC(2012, 0, 7), 4.5],
    [Date.UTC(2012, 0, 8), 4.5],
    [Date.UTC(2012, 0, 9), 4.5],
    [Date.UTC(2012, 0, 10), 4.5],
    [Date.UTC(2012, 0, 11), 4.5],
    [Date.UTC(2012, 0, 12), 4.5],
    [Date.UTC(2012, 0, 13), 4.5],
    [Date.UTC(2012, 0, 14), 4.5],
  ]),

  title: "Sensor Data"

  # Possibly Keep and modify to delete and individual record
#  actions:
#    delete: ->
#      @get('model').destroyRecord().then =>
#        @transitionToRoute 'sensors'
