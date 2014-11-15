#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require handlebars
#= require ember
#= require ember-data
#= require ember-localstorage-adapter
#= require highcharts
#= require mathjs
#= require moment
#= require jquery.cookie
#= require ember-list-view
#= require_self
#= require app

# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create(rootElement: '#ember-app')

$.cookie.json = true
