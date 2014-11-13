App.GraphsController = Ember.ObjectController.extend({

  data: (->
  [
    [Date.UTC(2012, 0, 1), 0],
    [Date.UTC(2012, 0, 2), 2],
    [Date.UTC(2012, 0, 3), 3],
    [Date.UTC(2012, 0, 4), 2.15],
    [Date.UTC(2012, 0, 5), 2.45],
    [Date.UTC(2012, 0, 6), 6],
    [Date.UTC(2012, 0, 7), 4.5],
  ]),

})
