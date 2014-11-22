App.PinNumber = DS.Model.extend
  name: DS.attr('string')
  transmitter: DS.belongsTo('transmitter')
  sensor: DS.belongsTo('sensor')
