App.GraphsController = Ember.ObjectController.extend({

 chartSeries: (->
    revenues = @map((order)->
      parseFloat(order.revenue)
    )
    quantities = @mapBy('quantity')

    [
      {
        name: 'Quantity',
        data: quantities
      },
      {
        name: 'Revenue',
        data: revenues
      }
    ]
  ).property('@each')

})
