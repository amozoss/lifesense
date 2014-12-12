App.Sensor = DS.Model.extend
  name: DS.attr('string')
  pin_number: DS.belongsTo('pin_number')
  clockwork_database_event: DS.belongsTo('clockwork_database_event')
  formula: DS.attr('string')
  lower: DS.attr('string')
  led: DS.attr('boolean')
  user: DS.belongsTo('user')
  records: DS.hasMany('records', {async: true})
