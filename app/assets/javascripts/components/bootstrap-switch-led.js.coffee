App.BootstrapSwitchLedComponent = Ember.Component.extend
  contentChanged: (->
    @$("[type='checkbox']").bootstrapSwitch('state', @get('isLED'))
  ).observes('isLED')

  afterRenderEvent: ->
    @$("[type='checkbox']").bootstrapSwitch('size', @get('size'))
    @$("[type='checkbox']").bootstrapSwitch('labelText', @get('labelText'))
    @$("[type='checkbox']").bootstrapSwitch('state', @get('isLED'))
    self = @
    @$("[type='checkbox']").on "switchChange.bootstrapSwitch", (e, data)->
      console.log('switched')
      self.sendAction('action', data)
