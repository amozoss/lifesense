#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require handlebars
#= require ember
#= require ember-data
#= require highcharts
#= require mathjs
#= require moment
#= require socket.io
#= require ember-sockets
#= require jquery.cookie
#= require ember-list-view
#= require_self
#= require app

# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create(
  rootElement: '#ember-app'

  Socket: EmberSockets.extend({
    host: 'localhost'
    port: 3507
    controllers: ['sensors_sensor', 'sensors']
    autoConnect: true
  })
)

$.cookie.json = true
