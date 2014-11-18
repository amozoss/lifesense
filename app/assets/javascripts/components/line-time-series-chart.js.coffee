App.LineTimeSeriesChartComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['highcharts']

  contentChanged: (->
    @rerender()
  ).observes('series', 'data')

  didInsertElement:( ->
    Highcharts.setOptions({
      global: {
        useUTC: false
      }
    })
    @draw()
  )
  
  updateTitle: (->
    chart = $("##{@chartId}").highcharts()
    chart.setTitle({
      text: @get('title')
    }
    )).observes('title')



  draw: ->
    $("##{@chartId}").highcharts({
      chart: { zoomType: 'x' },
      title: { text:  @get('title') }, #{ text: 'Non Linear Sample Data' }, # Possibly dynamic
      subtitle: {
        text: 'Click and drag the plot area to zoom in'
      },
      xAxis: {
        type: 'datetime',
        #minRange: 10 * 24 * 3600000 # 10 TODO days could make smaller?
      },
      yAxis: {
        title: {
          text: 'Data Values Units' # TODO make dynamic based on units
        },
      },
      legend: { enabled: false },
      plotOptions: {
        area: {
          fillColor: {
            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
            stops: [
              [0, Highcharts.getOptions().colors[0]],
              [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
            ]
          },

          marker: { radius: 2 },
          lineWidth: 1,
          states: {
            hover: { lineWidth: 1 }
          },
          threshold: null
        }
      },
      series: [{
        type: 'area',
        name: 'Data Value', # TODO dynamically get property
        data:  @data ,
      }]
    })

