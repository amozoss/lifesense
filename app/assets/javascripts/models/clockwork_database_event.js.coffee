App.ClockworkDatabaseEvent = DS.Model.extend
  at: DS.attr('string')
  frequency_quantity: DS.attr('number')
  frequency_period: DS.belongsTo('frequency_period')
