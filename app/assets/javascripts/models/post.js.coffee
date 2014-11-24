App.Post = DS.Model.extend
  title: DS.attr('string')
  content: DS.attr('string')
  updated_at: DS.attr('date')
  tag: DS.belongsTo('tag')
