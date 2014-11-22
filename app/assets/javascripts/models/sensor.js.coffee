App.Sensor = DS.Model.extend
  name: DS.attr('string')
  pin_number: DS.attr('number')
  formula: DS.attr('string')
  user: DS.belongsTo('user')
  transmitter: DS.belongsTo('transmitter')
  records: DS.hasMany('records', {async: true})
