
App.BootstrapSwitch = Ember.View.extend(
  classNames: ['switch']

  templateName: 'views/bootstrap-switch'

  afterRenderEvent: ->
    @$("[type='checkbox']").bootstrapSwitch('size', 'small')
    pin = @pin
    controller = @controller
    @$("[type='checkbox']").on "switchChange.bootstrapSwitch", (e, data)->
      controller.send('led', pin, data)
      


  hasChanged: (e, data) ->
    #@controller.set('isChecked', data)
    console.log(data)
    console.log(e)

    console.log("changed")
)
