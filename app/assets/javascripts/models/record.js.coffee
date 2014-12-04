App.Record = DS.Model.extend
  x: DS.attr('number')
  y: DS.attr('number')
  sensor: DS.belongsTo('sensor')
