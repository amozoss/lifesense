Ember.Handlebars.registerBoundHelper('markdown', (content) ->
  new Handlebars.SafeString(marked(content))
)
