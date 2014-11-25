App.PostsNewController = Ember.Controller.extend
  title: null
  content: null
  tag: null
  tags: null

  setupTags: ->
    @store.find('tag').then (tags)=>
      console.log(tags.content)
      @set('tags', tags.content)

  actions:
    createPost: ->
      data = @getProperties(
        'title',
        'content',
        'tag'
      )
      self = @
      post = @store.createRecord('post', data)
        
      post.save().then =>
        @setProperties(
          title: null
          content: null 
          tag: null
        )
        self.transitionToRoute "posts.post", post


