Ember.Handlebars.helper('format-date', (date)->
  moment(date).format('LLL'))
