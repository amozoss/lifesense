App.Sensor = DS.Model.extend
  name: DS.attr('string')
  pin_number: DS.belongsTo('pin_number')
  formula: DS.attr('string')
  lower: DS.attr('string')
  led: DS.attr('boolean')
  user: DS.belongsTo('user')
  records: DS.hasMany('records', {async: true})
