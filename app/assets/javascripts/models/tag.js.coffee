App.Tag = DS.Model.extend
  name: DS.attr('string')
  posts: DS.hasMany('posts', {async: true})
