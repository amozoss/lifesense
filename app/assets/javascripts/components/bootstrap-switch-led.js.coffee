App.BootstrapSwitchLedComponent = Ember.Component.extend
  contentChanged: (->
    @$("[type='checkbox']").bootstrapSwitch('state', @get('isLED'))
  ).observes('isLED')

  setLeds: (->
    leds = @get('leds')
    pinName = @get('pinName')
    if leds
      value = leds[pinName]
      if value
        value = true
      else
        value = false

      @$("[type='checkbox']").bootstrapSwitch('state', value)
  ).observes('leds')


  afterRenderEvent: ->
    @$("[type='checkbox']").bootstrapSwitch('size', @get('size'))
    @$("[type='checkbox']").bootstrapSwitch('labelText', @get('labelText'))
    @$("[type='checkbox']").bootstrapSwitch('state', @get('isLED'))
    self = @
    @$("[type='checkbox']").on "switchChange.bootstrapSwitch", (e, data)->
      self.sendAction('action', data, self.get('pinName'), self.get('transToken'))
