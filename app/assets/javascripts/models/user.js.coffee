App.User = DS.Model.extend
  name: DS.attr('string')
  email: DS.attr('string')
  token: DS.attr('string')
  admin: DS.attr('boolean')
  password: DS.attr('string')
  password_confirmation: DS.attr('string')
  transmitters: DS.hasMany('transmitter', {async: true})
  sensors: DS.hasMany('sensors', {async: true})

