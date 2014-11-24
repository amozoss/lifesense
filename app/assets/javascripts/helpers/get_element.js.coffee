Ember.Handlebars.helper('get-element', (record, index)->
  record[index]
)

Ember.Handlebars.helper('get-first-element-formatted', (record)->
  moment(record[0]).format('LLL')
)

