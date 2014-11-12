App.GraphsRoute = Ember.Route.extend({
  model: ->
    [
      {
        id: 1,
        firstName: 'James',
        lastName: 'Deen',
        quantity: 1,
        revenue: '10.00',
        productId: 0,
      },
      {
        id: 2,
        firstName: 'Alex',
        lastName: 'Baldwin',
        quantity: 2,
        revenue: '20.00',
        productId: 1,
      },
      {
        id: 3,
        firstName: 'Zach',
        lastName: 'Toolson',
        quantity: 10,
        revenue: '120.00',
        productId: 3,
      }
    ]
})
