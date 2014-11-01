App.Transmitter = DS.Model.extend
  name: DS.attr('string')
  transmitter_token: DS.attr('string')
  user: DS.belongsTo('user')
