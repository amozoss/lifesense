App.PostsController = Ember.ArrayController.extend
  needs: ['application']

  tags: null

  filterName: 'all'

  isAdmin: Ember.computed.alias('controllers.application.isAdmin')

  height: (->
    if window.mobilecheck()
      return 100
    else 
      return 500
  )()

  setupTags: ->
    tags = @store.all('tag')
    @set('tags', tags)

  filteredContent: (->
    content = @get('content.content')
    filter = @get('filterName')

    if filter == 'all'
      return content

    content.filter (item)->
      item.get('tag.name') == filter

  ).property('content.isLoaded', 'content.@each', 'filterName')

  isAll: (->
    if @get('filterName') == 'all'
      return 'active'
  ).property('filterName')

  isSoftware: (->
    if @get('filterName') == 'Software'
      return 'active'
  ).property('filterName')

  isHardware: (->
    if @get('filterName') == 'Hardware'
      return 'active'
  ).property('filterName')

  isMeeting: (->
    if @get('filterName') == 'Meeting'
      return 'active'
  ).property('filterName')

  isChallenges: (->
    if @get('filterName') == 'Challenges'
      return 'active'
  ).property('filterName')

  actions: 
    all: ->
      @set('filterName', 'all')

    software: ->
      @set('filterName', 'Software')

    hardware: ->
      @set('filterName', 'Hardware')

    meeting: ->
      @set('filterName', 'Meeting')

    challenges: ->
      @set('filterName', 'Challenges')

  
