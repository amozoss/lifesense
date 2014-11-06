App.Record = DS.Model.extend
  time_stamp: DS.attr('number')
  value: DS.attr('number')
  sensor: DS.belongsTo('sensor')
