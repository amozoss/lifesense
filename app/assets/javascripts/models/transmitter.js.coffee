App.Transmitter = DS.Model.extend
  name: DS.attr('string')
  transmitter_token: DS.attr('string')
  pin_numbers: DS.hasMany('pin_numbers', {async: true})
  user: DS.belongsTo('user')
