Ember.Handlebars.helper('trans-sensor', (transmitterId, pinName, sensorName)->
  if transmitterId == null || pinName == null
    return "(unassigned) " + sensorName
  else 
    return "(" + transmitterId + ":" + pinName + ") " + sensorName
)
