Ember.Handlebars.helper('get-first-element', (record)->
  record[0]
)

Ember.Handlebars.helper('get-first-element-formatted', (record)->
  moment(record[0]).format('LLL')
)

Ember.Handlebars.helper('get-second-element', (record)->
  record[1]
)
