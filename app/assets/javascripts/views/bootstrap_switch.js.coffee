App.BootstrapSwitch = Ember.View.extend(
  classNames: ['switch']

  templateName: 'views/bootstrap-switch'

  afterRenderEvent: ->
    @$("[type='checkbox']").bootstrapSwitch('size', 'small')
    controller = @controller
    action = @action
    @$("[type='checkbox']").on "switchChange.bootstrapSwitch", (e, data)->
      controller.send(action, data)
)
